# 🚀 To-Do App Deployment on AWS S3

## 📌 Project Overview
This project demonstrates deployment of a static To-Do web application using AWS S3 with automated CLI-based workflow.

## 🌐 Live Demo
👉 http://srushti-todo-app-1774624645.s3-website-ap-south-1.amazonaws.com

## 🛠️ Tech Stack
* HTML, CSS, JavaScript
* AWS S3 (Static Website Hosting)
* AWS CLI
* Git & GitHub

## ⚙️ Features
* Add & delete tasks
* Responsive UI
* Serverless deployment
* Fast and scalable hosting

## 🚀 Deployment Steps

```bash
# Configure AWS
aws configure

# Create bucket
aws s3 mb s3://your-bucket-name

# Upload files
aws s3 sync . s3://your-bucket-name

# Enable static hosting 
```

## 🔐 Key Learnings
* S3 static hosting
* Bucket policies & permissions
* CLI-based automation

## 💡 Future Improvements
* Add CloudFront (CDN + HTTPS)
* CI/CD using GitHub Actions
* Custom domain integration
