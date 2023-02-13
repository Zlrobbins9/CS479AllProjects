XYChart lineChart;
FloatList lineChartX;
FloatList lineChartY;

int count;

void graph_setup() {
  lineChart = new XYChart(this);
  lineChartX = new FloatList();
  lineChartY = new FloatList();
  lineChart.setData(lineChartX.array(), lineChartY.array());
  
  lineChart.showXAxis(true);
  lineChart.showYAxis(true);
  lineChart.setMinY(50);
  lineChart.setMaxY(120);
  
  lineChart.setYFormat("00");
  lineChart.setXFormat("0");
  
  lineChart.setPointColour(color(180, 50, 100, 100));
  lineChart.setPointSize(width/30);
  lineChart.setLineWidth(width/100);
  
  count = 0;
}

void graph_draw() {
  background(250, 182, 112);
  textSize(30);
  
  fill(225);
  rectMode(CENTER);
  rect(51*width/100, height/4, width/2, height/2);
  fill(0);
  lineChart.draw(width/4, 15, width/2, height/2);
  
  textSize(40);
  text("User's Heart Beat", width/2, 57*height/100);
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
