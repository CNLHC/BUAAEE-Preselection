from pyeda.inter import *
import numpy as np
import copy
import re
import functools
import argparse
import logging

class Gate():
    def __init__(self,primative,inst=''):
        self.instanceName = inst
        self.primative = primative
        self._subGate = []
        self._subVariableName = []
        self._subVariableNot = {}

    def addSubGate(self,gate):
        self._subGate.append(gate)

    def addSubVariable(self,variable):
        name = variable.replace('~','').replace(' ','')
        self._subVariableName.append(name)
        
        if '~' in variable:
            self._subVariableNot[name] = False
        else:
            self._subVariableNot[name] = True

    def gatherVariable(self):
        Variable = list(functools.reduce(lambda x,y:x+y ,[j.gatherVariable() for j in self._subGate],[]))
        Variable = Variable + self._subVariableName
        Variable.append(self._constructOutWireName())
        return list(set(Variable))

    def _constructOutWireName(self):
        return "t%sOut"%self.instanceName
    @property
    def outputWire(self):
        return self._constructOutWireName()


    def getInstanceExpr(self):
        paraListStr = functools.reduce(lambda x,y:"%s%s,"%(x,(y if self._subVariableNot[y] else '~'+y)),self._subVariableName,',')[:-1]
        subGateOutStr = functools.reduce(lambda x,y:"%s%s,"%(x,y),[i.outputWire for i in self._subGate ],',')[:-1]

        return "%s %s(%s%s%s);"%(
                self.primative,
                self.instanceName,
                self._constructOutWireName(),
                paraListStr,
                subGateOutStr
                )

    def flattenOut (self):
        lineBuffer=[]
        variable = self.gatherVariable()
        print(variable)
        lineBuffer=lineBuffer+["wire %s;"%i for i in variable if '['not in i];
        lineBuffer=lineBuffer+[self.getInstanceExpr()]
        lineBuffer=lineBuffer+[i.getInstanceExpr() for i in self._subGate]
        return lineBuffer

def expGenerate(tt):
    Counter=ttvars('counter',tt[0])
    truthTableList = [truthtable(Counter,i) for i in tt[1]]
    return espresso_tts(*truthTableList)

def ttReader(fp):
    with open(fp,'r') as fID:
        lineBuffer = fID.readlines()
        lineBuffer = [i for i in lineBuffer if i !='\n']
        lineBuffer = [i.replace('\t','').replace('\n','').replace(' ','') for i in lineBuffer ]
        lineBuffer = [i.split('|') for i in lineBuffer ]
        inputCount = len(lineBuffer[0][0])
        outputCount = len(lineBuffer[0][1])
        logging.warning("InputCount:{ic} \t OutputCount:{oc}".format(ic=inputCount,oc=outputCount))
        return (inputCount,[''.join([j[1][i] for j in lineBuffer]) for i in range(0,outputCount)])



def parseGate(root,deepth=0,index =0, inst ='U'):
    pattern = re.compile("(And|Or)\((.*)\)")
    typeStr = re.match(pattern,root).group(1)
    paraStr = re.match(pattern,root).group(2)
    subGatePattern = "(?:And|Or)\(.*?\)[,]?"
    pattern = re.compile("%s"%subGatePattern)

    subGate = re.findall(pattern,paraStr)
    subPara = [i for i in pattern.sub(lambda m:'',paraStr).replace(' ','').split(',') if len(i)>0]

    U = Gate(typeStr.lower(),"%s%d%d"%(inst,deepth,index))

    for v,g in enumerate(subGate):
        U.addSubGate(parseGate(g,deepth=deepth+1,index=v,inst=inst))

    for v in subPara:
        U.addSubVariable(v)

    return U

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--ttfile','-t', help='truth table input ')
    parser.add_argument('--outfile','-o', help='verilog output')
    args = parser.parse_args()
    import os
    fp = (args.ttfile)
    if not os.path.isfile(fp):
        print("can't read truth table file")
        return 

    tt = ttReader(fp)
    exps = expGenerate(tt)
    gate = [parseGate(exp.__str__(),inst='U%dU'%v) for v,exp in enumerate(exps)]
    with open(args.outfile,'w') as fp:
        for v,e in enumerate(gate):
            fp.write("\n//====================Truthtable Variable:%d====================\n"%v)
            fp.writelines([i+'\n' for i in e.flattenOut()])

if __name__=="__main__":
    main()

#operatorTransform(1)
