pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Security Audit') {
            steps {
                sh 'npm audit --audit-level=high || true'
            }
        }

        stage('Code Linting') {
            steps {
                sh 'npx eslint app.js || true'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devsecops-app .'
            }
        }

        stage('Trivy Scan') {
            steps {
                sh 'trivy image devsecops-app || true'
            }
        }

        stage('OPA Policy Check') {
            steps {
                sh 'opa eval --data policy.rego --input input.json "data.cicd.deny"'
            }
        }

        stage('Terraform Apply (Simulated Deployment)') {
            steps {
                sh 'terraform init'
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
