Bare bone folder structure for mvc development with Sinatra framework.

Usage:
Create controllers in the controllers folder and map them in the config.ru. 
Create models in the models folder and use them in the controllers.
Create helpers in the helpers folder and use them in your views.
Create general purpose classes and modules in the lib folder.

All of the classes will be autoladed. 
The naming convention should be followed:
	Snakes for the names of the ruby files, cammel case for the names of the classes and modules.
All of the gems will be placed in the Gemfile and will be installed with bundle install command.
For running init tasks place ruby file in the initializers folder. Every file in the initializers
will be runned on startup.

Hapy coding!
