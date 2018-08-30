# volleystats

A volley stats material design app in Flutter.  
I developed this during my very own 'Summer of Code 2018' to explore the potential of the platform and lean Dart.  
I plan to add a couple of more features in the coming months.

![Alt Text](https://github.com/beraldofilippo/volleystats/blob/master/2018.08.30_18.04.41.gif)

## Features
MVP architecture.  
Error screen.  
Empty screens.   
It uses endpoints served by *sportradar* (https://developer.sportradar.com/).  
Sometimes the API fails with a 403 Forbidden because it's using a sandbox environment which limits the call/second rate.  
I purposely did not include secret API keys so testing on this source isn't really possible unless you get a key and store is as secrets.json {"api_key" : <your key>} in the root of the project. Soz.

### TODO
Add other sub screens to the tournament details page.  
Add cached responses for HTTP GETs.  
Refine UI.

## Acnowledgements
Icons come form FaltIcon - Icon made by Freepik from www.flaticon.com
