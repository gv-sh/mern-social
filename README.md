# MERN Social 2.0
- *Looking for the first edition code? [Check here](https://github.com/shamahoque/mern-social/tree/master)*

A simple social media application with users, posts, likes and comments - developed using React, Node, Express and MongoDB. 

![MERN Social](https://s3.amazonaws.com/mernbook/git+/social.png "MERN Social")

### [Live Demo](http://social2.mernbook.com/ "MERN Social")

#### What you need to run this code
1. Node (13.12.0)
2. NPM (6.14.4) or Yarn (1.22.4)
3. MongoDB (4.2.0)

####  How to run this code
1. Make sure MongoDB is running on your system 
2. Clone this repository
3. Open command line in the cloned folder,
   - To install dependencies, run ```  npm install  ``` or ``` yarn ```
   - To run the application for development, run ```  npm run development  ``` or ``` yarn development ```
4. Open [localhost:3000](http://localhost:3000/) in the browser
---- 
### More applications built using this stack

* [MERN Skeleton](https://github.com/shamahoque/mern-social/tree/second-edition)
* [MERN Classroom](https://github.com/shamahoque/mern-classroom)
* [MERN Marketplace](https://github.com/shamahoque/mern-marketplace/tree/second-edition)
* [MERN Expense Tracker](https://github.com/shamahoque/mern-expense-tracker)
* [MERN Mediastream](https://github.com/shamahoque/mern-mediastream/tree/second-edition)
* [MERN VR Game](https://github.com/shamahoque/mern-vrgame/tree/second-edition)

Learn more at [mernbook.com](http://www.mernbook.com/)

----
## Get the book
#### [Full-Stack React Projects - Second Edition](https://www.packtpub.com/web-development/full-stack-react-projects-second-edition)
*Learn MERN stack development by building modern web apps using MongoDB, Express, React, and Node.js*

<a href="https://www.packtpub.com/web-development/full-stack-react-projects-second-edition"><img src="https://mernbook.s3.amazonaws.com/git+/Book_2Ed.jpg" align="center" width="400" alt="Full-Stack React Projects"></a>

React combined with industry-tested, server-side technologies, such as Node, Express, and MongoDB, enables you to develop and deploy robust real-world full-stack web apps. This updated second edition focuses on the latest versions and conventions of the technologies in this stack, along with their new features such as Hooks in React and async/await in JavaScript. The book also explores advanced topics such as implementing real-time bidding, a web-based classroom app, and data visualization in an expense tracking app.

Full-Stack React Projects will take you through the process of preparing the development environment for MERN stack-based web development, creating a basic skeleton app, and extending it to build six different web apps. You'll build apps for social media, classrooms, media streaming, online marketplaces with real-time bidding, and web-based games with virtual reality features. Throughout the book, you'll learn how MERN stack web development works, extend its capabilities for complex features, and gain actionable insights into creating MERN-based apps, along with exploring industry best practices to meet the ever-increasing demands of the real world.

Things you'll learn in this book:

- Extend a MERN-based application to build a variety of applications
- Add real-time communication capabilities with Socket.IO
- Implement data visualization features for React applications using Victory
- Develop media streaming applications using MongoDB GridFS
- Improve SEO for your MERN apps by implementing server-side rendering with data
- Implement user authentication and authorization using JSON web tokens
- Set up and use React 360 to develop user interfaces with VR capabilities
- Make your MERN stack applications reliable and scalable with industry best practices

If you feel this book is for you, get your [copy](https://www.amazon.com/dp/1839215410) today!

---

### Docker Deployment
To deploy this application using Docker:

1. Make sure you have Docker and Docker Compose installed on your system.
2. Clone this repository.
3. Navigate to the project directory.
4. Run `docker-compose up --build` to build and start the containers.
5. Access the application at `http://localhost:3000`.

```
docker container prune
docker image prune -a
docker volume prune
docker network prune
```

### Kubernetes Deployment
To deploy this application using Kubernetes with Minikube:

1. Install Minikube, kubectl, and Docker if you haven't already.
2. Start Minikube:
   ```
   minikube start
   ```
3. Enable the Minikube Docker daemon:
   ```
   eval $(minikube docker-env)
   ```
4. Build the Docker image for the MERN app:
   ```
   docker build -t mern-social:latest .
   ```
5. Generate SSL certificates for Nginx:
   ```
   openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=localhost"
   kubectl create secret tls ssl-certs --key tls.key --cert tls.crt
   ```
6. Apply the Kubernetes manifests:
   ```
   kubectl apply -f kubernetes/
   ```
7. Wait for all pods to be ready:
   ```
   kubectl get pods -w
   ```
8. Access the application:
   ```
   minikube service nginx
   ```
   This will open the HTTPS URL of your application in your default browser.
9. To access Mongo Express:
   ```
   minikube service mongo-express
   ```

Note: For production use, replace the self-signed SSL certificates with proper ones and update the Nginx configuration accordingly.

To clean up Kubernetes resources:
```
kubectl delete -f kubernetes
```