# OOP_Assignemnt1_Year2
GUI assignment for Object Oriented programming

[![Video](http://img.youtube.com/vi/LIb_wZNv7BY/0.jpg)](http://www.youtube.com/watch?v=LIb_wZNv7BY)]

Install Minim Library in processing for sound, sketch/add library and search for the minim library and install it.
Run the sketch at 1920 X 1080 resolution for optimal scaling of UI

When the program launches click the green Engine Button this will animate and load in the UI.
You can interact with various parts of the UI, all of the buttons on screeen work and carryout a function.
The sliding color bars on the left bottom of the screen are used to adjust the color of the oveerall UI mess around it with it for preference.

Click and hold the Orange Star to zoom in the solar system and bring up a new menu, all buttons and mouse overs function in this part, to exit that area click above half height of the screen and hold.

In the main UI area where you start off you can interact with the radar and 3d Model of the ship using the Arrow Keys and also You can use W and S to change the speed of the ship. You will notice this working as the the trusters engaged pop up will come up and also the speed dial will fill up.

The missile,gun and drill buttons will enable the UI for the weapons system in the UI and these will react to your mouse input when the mouse is in the area of the middle windshield of the spaceship. You can press SpaceBar to fire the gun and use mouseclick to fire the drill.

On the left Bottom Corner of the screen is the sound visualiser which visualises the soundtrack of the UI It is a sphere. If clicked it will animate and go into fullscreen where you can then intarct with it by moving the mouse to different parts of the screen.

Once the fuel reaches below 20 a warning sign for the fuel comes up.

The System time and date is displayed at the top of the ui.

***PARTS OF THE PROGRAM TO NOTE*****
- The 3D solar system with the orbiting planets
  And the graphs associated with and data. All of these graphs and the 3D planets themselves are all generated from a data text file loaded   and then generated on screen. The pictures on mouse over are loaded in through the text file as strings which reference images in the       data folder
- The Sound visualiser was created from an example of a flat line sound visualiser, I took this idea and how the buffer size of the song     sample works and transformed it into a circle of points that react to the sound and make it look like a circle sound visualiser, these     are made using trignometry and maping
- The Buttons are objects of a single class and carry out different functions on click.
- The music in the program uses the minim library
- The Weapon Croshairs are created from a single class, however the Missile Croshair inherits the basic croshair class and extends that       class
- The 4 different graphs of the solar system all use the map function to scale the graphs and make them all look proportional
- The color bars are mapped and change the color of the radar object, but everything else in the UI inherits this fill and stroke colour     where appropriate
