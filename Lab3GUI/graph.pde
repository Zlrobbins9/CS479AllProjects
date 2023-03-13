XYChart lineChart, MFGraph, LFGraph, MMGraph, HeelStepGraph, MFPGraph;
FloatList lineChartX = new FloatList(), lineChartY = new FloatList();


int count;
int startTier = 1;

void graph_setup() {
  lineChart = new XYChart(this);
  MFGraph = new XYChart(this);
  LFGraph = new XYChart(this);
  MMGraph = new XYChart(this);
  MFPGraph = new XYChart(this);
  HeelStepGraph = new XYChart(this);
  
  lineChart.setData(lineChartX.array(), lineChartY.array());
  
  
  MFGraph.setData(FeetSensor_XVals.array(), MFPressureList.array());
  LFGraph.setData(FeetSensor_XVals.array(), LFPressureList.array());
  MMGraph.setData(FeetSensor_XVals.array(), MMPressureList.array());
  HeelStepGraph.setData(FeetSensor_XVals.array(), HeelPressureList.array());
  MFPGraph.setData(FeetSensor_XVals.array(), MFPList.array());
  
  //lineChart.showXAxis(true);
  //lineChart.showYAxis(true);
  //lineChart.setMinY(50);
  //lineChart.setMaxY(200);
  //lineChart.setYFormat("00");
  //lineChart.setXFormat("0");
  //lineChart.setPointColour(color(125, 100));
  //lineChart.setPointSize(width/100);
  //lineChart.setLineWidth(width/300);
  
  LFGraph.setYAxisLabel("LF Graph");
  LFGraph.showYAxis(true);
  LFGraph.setMinY(0);
  LFGraph.setMaxY(125);
  LFGraph.setYFormat("00");
  LFGraph.setXFormat("0");
  LFGraph.setPointColour(color(125, 100));
  LFGraph.setPointSize(width/1000);
  LFGraph.setLineWidth(width/900);
  
  MFGraph.setYAxisLabel("MF Graph");
  MFGraph.showYAxis(true);
  MFGraph.setMinY(0);
  MFGraph.setMaxY(125);
  MFGraph.setYFormat("00");
  MFGraph.setXFormat("0");
  MFGraph.setPointColour(color(125, 100));
  MFGraph.setPointSize(width/1000);
  MFGraph.setLineWidth(width/900);
  
  MMGraph.setYAxisLabel("MM Graph");
  MMGraph.showYAxis(true);
  MMGraph.setMinY(0);
  MMGraph.setMaxY(125);
  MMGraph.setYFormat("00");
  MMGraph.setXFormat("0");
  MMGraph.setPointColour(color(125, 100));
  MMGraph.setPointSize(width/1000);
  MMGraph.setLineWidth(width/900);
  
  HeelStepGraph.setYAxisLabel("Heel Graph");
  HeelStepGraph.showYAxis(true);
  HeelStepGraph.setMinY(0);
  HeelStepGraph.setMaxY(125);
  HeelStepGraph.setYFormat("00");
  HeelStepGraph.setXFormat("0");
  HeelStepGraph.setPointColour(color(125, 100));
  HeelStepGraph.setPointSize(width/1000);
  HeelStepGraph.setLineWidth(width/900);
  
  MFPGraph.setYAxisLabel("MFP Graph");
  MFPGraph.showYAxis(true);
  MFPGraph.setMinY(0);
  MFPGraph.setMaxY(125);
  MFPGraph.setYFormat("00");
  MFPGraph.setXFormat("0");
  MFPGraph.setPointColour(color(125, 100));
  MFPGraph.setPointSize(width/1000);
  MFPGraph.setLineWidth(width/900);
  
  count = 0;
}

void graph_draw() {
  background(220);
  DrawGraph();
  rectMode(CENTER);

  
  fill(0);
}

void DrawGraph()
{
  textSize(20);
  fill(0);
  MFGraph.draw(width/30, 0, width/4, height/4);
  LFGraph.draw(3*width/4, 0, width/4, height/4);
  MMGraph.draw(width/30, 11*height/16, width/4, height/4);
  HeelStepGraph.draw(3*width/4, 11*height/16, width/4, height/4);
  MFPGraph.draw(3*width/8, 3*height/8, width/4, height/4);
  
  textSize(40);
  fill(150);
  text("current Medial Force Percentage: " + CurMFP, width/2, 3*height/4);
}


void update_feetgraphs()
{
  
  FeetSensorCount++;
  //println("feet sensor count is: " + FeetSensorCount);
  FeetSensor_XVals.append(FeetSensorCount);
  MFPressureList.append(CurMF);
  LFPressureList.append(CurLF);
  MMPressureList.append(CurMM);
  HeelPressureList.append(CurHeel);
  CurMFP = ((CurMM + CurMF)*100)/(CurMM + CurMF + CurLF + CurHeel + 0.001);
  MFPList.append(CurMFP);
  
  //println("MFPressureList is currently: " + MFPressureList.get(0));
  if(MFPressureList.size() > 99 && FeetSensor_XVals.size() > 99){ //maximum size reached
  FeetSensor_XVals.remove(0);
  MFPressureList.remove(0);
  LFPressureList.remove(0);
  MMPressureList.remove(0);
  HeelPressureList.remove(0);
  MFPList.remove(0);
  }
  
  MFGraph.setData(FeetSensor_XVals.array(), MFPressureList.array());
  LFGraph.setData(FeetSensor_XVals.array(), LFPressureList.array());
  MMGraph.setData(FeetSensor_XVals.array(), MMPressureList.array());
  HeelStepGraph.setData(FeetSensor_XVals.array(), HeelPressureList.array());
  MFPGraph.setData(FeetSensor_XVals.array(), MFPList.array());
}


void graph_serialEvent(float val) {
  count++;
  //lineChartX.append(count);
  //lineChartY.append(val);
  
  if (lineChartX.size() > 7 && lineChartY.size() > 7) {
    lineChartX.remove(0);
    lineChartY.remove(0);
  }
  
  lineChart.setData(lineChartX.array(), lineChartY.array());
}
