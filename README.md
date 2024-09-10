# React Project Setup Script

This script automates the creation of a new React project with Vite, Tailwind CSS, and DaisyUI. It removes the default CSS files, sets up Tailwind CSS, and starts a local development server.

## Prerequisites

Before you begin, ensure you have the following installed:
- [Node.js](https://nodejs.org/)
- [npm](https://www.npmjs.com/)

## Installation

1. Clone this repository:
```bash
git clone https://github.com/stevenrhett/react-setup-script.git
```

2. Navigate into the project directory:
```bash
cd react-setup-script
 ```

3. Make the script executable:
```bash
 chmod +x setup-react-project.sh
```

## Usage

Run the script to create a new project:
```bash
./setup-react-project.sh
```

You will be prompted to enter the project name. The script will set up the project, install dependencies, and start the development server.

## Example
```bash
./setup-react-project.sh
Enter your project name: my-new-project
```

This will:
- Create a new Vite + React project
- Set up Tailwind CSS and DaisyUI
- Install all dependencies
- Start the development server at `http://localhost:5173`

## License

This project is licensed under the MIT License.

### 2. **Move Technical Content to Separate Files**

#### **`.gitignore`**
Include this file in the root of the repository:

```gitignore
# Node modules
node_modules

# Logs
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Build output
dist

# .env environment variable file
.env

# MacOS files
.DS_Store

# VS Code workspace settings
.vscode
```
