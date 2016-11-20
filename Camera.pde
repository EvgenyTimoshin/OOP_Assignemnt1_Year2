/*import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setupCamera()
{
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
}

void drawCamera()
{
  scale(2);
  opencv.loadImage(video);
  Radar radar = radars.get(0);
  tint(radar.c,126);
  image(video, 830, 10 , 150, 100);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

}

void captureEvent(Capture c) {
  c.read();
}*/