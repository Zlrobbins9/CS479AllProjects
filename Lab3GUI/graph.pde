XYChart lineChart;
FloatList lineChartX;
FloatList lineChartY;

int count;
int startTier = 1;

void graph_setup() {
  lineChart = new XYChart(this);
  lineChartX = new FloatList();
  lineChartY = new FloatList();
  lineChart.setData(lineChartX.array(), lineChartY.array());
  
  lineChart.showXAxis(true);
  lineChart.showYAxis(true);
  lineChart.setMinY(50);
  lineChart.setMaxY(200);
  
  lineChart.setYFormat("00");
  lineChart.setXFormat("0");
  
  lineChart.setPointColour(color(125, 100));
  lineChart.setPointSize(width/100);
  lineChart.setLineWidth(width/300);
  
  count = 0;
}

void graph_draw() {
  background(220);
  DrawGraph();
  rectMode(CENTER);
  text("Breath Value:" + curPressure, width/2, 30*height/32);

  
  fill(0);
}

void DrawGraph()
{
  textSize(30);
  //lineChart.setMinY((220-age)/2);
  //lineChart.setMaxY(220-age);
  fill(225);
  rectMode(CENTER);
  rect(51*width/100, 25*height/100, width/2, 19*height/40);
  fill(0);
  lineChart.draw(width/4, 0, width/2, height/2);
  
  textSize(40);
  fill(150);
}

void graph_serialEvent(float val) {
  count++;
  
  lineChartX.append(count);
  lineChartY.append(val);
  
  if (lineChartX.size() > 7 && lineChartY.size() > 7) {
    lineChartX.remove(0);
    lineChartY.remove(0);
  }
  
  lineChart.setData(lineChartX.array(), lineChartY.array());
}
