# Deploying MERN Stack to Uffizzi Pro

We're going to walk you how to deploy a MERN stack app to Uffizzi Pro.

MERN (Mongo, express, React, and Nodejs)

### Perequesites
- [Free account on Uffizzi](https://uffizzi.com)

> Note: all these steps below are done inside the main `server.js` file. In our case, inside server.js. 

Assuming you have the following folder structure

```
├── client
│   ├── build
│   ├── public
│   ├── src
│   ├── .gitignore
│   ├── package.json
│   ├── README.md
│   └──src
├── models
│   ├── user.js
│   ├── books.js
│   └── index.js
├── public
├── routes
├── .gitignore
├── server.js
├── package.json
└── README.MD
```


#### Step 1
> `server.js`

We will set `process.env.PORT` to our PORT variable to use Uffizzi  HTTPS port. Then add 8080 as a fallback port for our localhost development

We should end up with something like this
![PORT Images](public/images/port.png);


#### Step 2
> `server.js`

We will add an environment variable called `MONGODB_URI` for us to connect to MongoDB. In order to utilize this variable, we need to set our `mongoose.connect` with that variable. 

It should look like this
![MONGODB_URI](public/images/mongodb_uri.png);


#### Step 3
> `server.js`

Once our app is on Uffizzi, we need to send the static build files on our server so that Uffizzi can serve them. 

How do we know our app is on Uffizzi?
Well, by default Uffizzi has this environment variable called `NODE_ENV` with a value set to production. We can write a conditional logic to check if `NODE_ENV` has the value of production, if so, then we know for sure that our app is on Uffizzi. Then we serve the static files generated by React after we have successfully ran `npm run build` in the client folder.

We should end up having something like this
![Node Env](public/images/node_env.png);



#### Step 4
> `package.json`

You don't want to always keep doing `npm run build` to generate the build folder for you every time you do a change. We can let Uffizzi do it for us by using Node.js build scripts. Add the following line to the scripts block in package.json:

It should look like this
![Build Script](public/images/build.png);
