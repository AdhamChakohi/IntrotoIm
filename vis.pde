Table table;
float[][] stats = new float[22][3];
String countrr = "Ukraine";
int counter = 0;
int pointer = 0;

void setup() {
  size(800, 800);
  table = loadTable("dataset_out.csv", "header,csv");
  for (TableRow row : table.rows()) {

    String country = trim(row.getString("country"));

    if (country.equals(countrr)) {
      float year = row.getFloat("year");
      float percentage = row.getFloat("percentage");
      float median = row.getFloat("median");
      stats[counter][0] = year;
      stats[counter][1] = percentage;
      stats[counter][2] = median;
      counter++;
    }
  }
  rectMode(CENTER);
}


void draw() {
  int count2 = 0;
  int conv = round((stats[pointer%22][1]/100)*100);
  
  //println(stats[pointer][1],count2,conv);
  background(0);
  text(str(round(stats[pointer%22][0])),400,50);
  for (int i = 200; i<600; i+=40) { 
    for (int j = 200; j<600; j+=40) {
      if(count2<=conv){
        fill(255, 0, 0);
    } else {
        fill(0,0,255);
    }
      stroke(0);
      rect(i, j, 20, 20);
      
      count2++;
    }
  }
  //println(count2);
  //stroke(0,255,0);
  //strokeWeight(5);
  //line(100,750,700,750);
}

void keyPressed(){
  if (key==CODED){
    if(keyCode == RIGHT){
      pointer++;
    } else if (keyCode == LEFT){
      if (pointer == 0){
        pointer = 21;
      } else {
        pointer--;
      }
    }
    
  }
}