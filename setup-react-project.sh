#!/bin/bash

# React Setup Script with Vite, Tailwind CSS, and DaisyUI
# Author: Steven Rhett
# Description: Automates the creation of a React project with modern tooling

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_header() {
    echo ""
    echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
    echo ""
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check prerequisites
check_prerequisites() {
    print_header "Checking Prerequisites"

    # Check for Node.js
    if ! command_exists node; then
        print_error "Node.js is not installed"
        print_info "Please install Node.js from https://nodejs.org/"
        exit 1
    fi

    local node_version
    node_version=$(node --version | cut -d'v' -f2)
    print_success "Node.js $node_version installed"

    # Check Node.js version (should be >= 16.0.0)
    local major_version
    major_version=$(echo "$node_version" | cut -d'.' -f1)
    if [ "$major_version" -lt 16 ]; then
        print_error "Node.js version 16.0.0 or higher is required"
        print_info "Current version: $node_version"
        print_info "Please upgrade Node.js from https://nodejs.org/"
        exit 1
    fi

    # Check for npm
    if ! command_exists npm; then
        print_error "npm is not installed"
        print_info "npm should be installed with Node.js"
        exit 1
    fi

    local npm_version
    npm_version=$(npm --version)
    print_success "npm $npm_version installed"

    echo ""
}

# Function to validate project name
validate_project_name() {
    local name="$1"

    # Check if name is empty
    if [ -z "$name" ]; then
        print_error "Project name cannot be empty"
        return 1
    fi

    # Check if name contains only valid characters (letters, numbers, hyphens, underscores)
    if [[ ! "$name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        print_error "Project name can only contain letters, numbers, hyphens (-), and underscores (_)"
        print_info "Invalid characters detected in: '$name'"
        return 1
    fi

    # Check if name starts with a letter
    if [[ ! "$name" =~ ^[a-zA-Z] ]]; then
        print_error "Project name must start with a letter"
        return 1
    fi

    # Check if directory already exists
    if [ -d "$name" ]; then
        print_error "Directory '$name' already exists"
        print_info "Please choose a different name or remove the existing directory"
        return 1
    fi

    return 0
}

# Function to get project name from user
get_project_name() {
    local project_name

    while true; do
        echo -e "${BLUE}Enter your project name:${NC}"
        # shellcheck disable=SC2162
        read project_name

        if validate_project_name "$project_name"; then
            echo "$project_name"
            return 0
        fi

        echo ""
        print_warning "Please try again with a valid project name"
        echo ""
    done
}

# Function to create Vite project
create_vite_project() {
    local project_name="$1"

    print_header "Creating Vite + React Project"

    print_info "Running: npm create vite@latest $project_name -- --template react"

    if npm create vite@latest "$project_name" -- --template react; then
        print_success "Project '$project_name' created successfully"
    else
        print_error "Failed to create Vite project"
        exit 1
    fi

    echo ""
}

# Function to navigate to project directory
navigate_to_project() {
    local project_name="$1"

    if ! cd "$project_name"; then
        print_error "Failed to navigate to project directory"
        exit 1
    fi

    print_success "Navigated to project directory"
}

# Function to install Tailwind CSS
install_tailwind() {
    print_header "Installing Tailwind CSS"

    print_info "Installing tailwindcss, postcss, and autoprefixer..."

    if npm install -D tailwindcss postcss autoprefixer; then
        print_success "Tailwind CSS dependencies installed"
    else
        print_error "Failed to install Tailwind CSS dependencies"
        exit 1
    fi

    echo ""
}

# Function to initialize Tailwind CSS
initialize_tailwind() {
    print_header "Initializing Tailwind CSS"

    print_info "Creating Tailwind configuration files..."

    if npx tailwindcss init -p; then
        print_success "Tailwind configuration files created"
    else
        print_error "Failed to initialize Tailwind CSS"
        exit 1
    fi

    echo ""
}

# Function to setup Tailwind CSS directives
setup_tailwind_css() {
    print_header "Setting up Tailwind CSS"

    # Remove default index.css
    if [ -f "src/index.css" ]; then
        rm src/index.css
        print_success "Removed default index.css"
    fi

    # Create new index.css with Tailwind directives
    {
        echo "@tailwind base;"
        echo "@tailwind components;"
        echo "@tailwind utilities;"
    } > src/index.css

    print_success "Created index.css with Tailwind directives"
    echo ""
}

# Function to configure Tailwind for DaisyUI
configure_tailwind_config() {
    print_header "Configuring Tailwind CSS"

    # Remove default tailwind.config.js
    if [ -f "tailwind.config.js" ]; then
        rm tailwind.config.js
        print_success "Removed default tailwind.config.js"
    fi

    # Create new tailwind.config.js with DaisyUI
    cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [require("daisyui")],
}
EOF

    print_success "Created tailwind.config.js with DaisyUI plugin"
    echo ""
}

# Function to install DaisyUI
install_daisyui() {
    print_header "Installing DaisyUI"

    print_info "Installing daisyui..."

    if npm i -D daisyui@latest; then
        print_success "DaisyUI installed successfully"
    else
        print_error "Failed to install DaisyUI"
        exit 1
    fi

    echo ""
}

# Function to create demo component
create_demo_component() {
    print_header "Creating Demo Component"

    # Remove default App.css
    if [ -f "src/App.css" ]; then
        rm src/App.css
        print_success "Removed default App.css"
    fi

    # Create new App.jsx with demo code
    cat > src/App.jsx << 'EOF'
function App() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 flex items-center justify-center p-4">
      <div className="card w-full max-w-2xl bg-base-100 shadow-2xl">
        <div className="card-body">
          <h1 className="card-title text-4xl font-bold text-center justify-center mb-4">
            Welcome to React! 🚀
          </h1>
          <p className="text-center text-lg mb-6">
            Your project is set up with <span className="font-bold text-primary">Vite</span>,
            <span className="font-bold text-secondary"> Tailwind CSS</span>, and
            <span className="font-bold text-accent"> DaisyUI</span>!
          </p>

          <div className="divider">Quick Start</div>

          <div className="space-y-3">
            <div className="alert alert-info">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" className="stroke-current shrink-0 w-6 h-6">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
              </svg>
              <span>Edit <code className="font-mono">src/App.jsx</code> to get started</span>
            </div>

            <div className="alert alert-success">
              <svg xmlns="http://www.w3.org/2000/svg" className="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
              <span>Hot Module Replacement (HMR) is enabled</span>
            </div>
          </div>

          <div className="divider">Resources</div>

          <div className="grid grid-cols-2 gap-4">
            <a href="https://react.dev/" target="_blank" rel="noopener noreferrer" className="btn btn-outline btn-primary">
              React Docs
            </a>
            <a href="https://vitejs.dev/" target="_blank" rel="noopener noreferrer" className="btn btn-outline btn-secondary">
              Vite Docs
            </a>
            <a href="https://tailwindcss.com/" target="_blank" rel="noopener noreferrer" className="btn btn-outline btn-accent">
              Tailwind CSS
            </a>
            <a href="https://daisyui.com/" target="_blank" rel="noopener noreferrer" className="btn btn-outline btn-info">
              DaisyUI
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}

export default App;
EOF

    print_success "Created demo component in App.jsx"
    echo ""
}

# Function to install dependencies
install_dependencies() {
    print_header "Installing Dependencies"

    print_info "Running npm install (this may take a few minutes)..."

    if npm install; then
        print_success "All dependencies installed successfully"
    else
        print_error "Failed to install dependencies"
        exit 1
    fi

    echo ""
}

# Function to display success message
display_success_message() {
    local project_name="$1"

    print_header "Setup Complete!"

    print_success "Project '$project_name' is ready!"
    echo ""
    print_info "Next steps:"
    echo ""
    echo "  1. Navigate to your project:"
    echo -e "     ${BLUE}cd $project_name${NC}"
    echo ""
    echo "  2. Start the development server:"
    echo -e "     ${BLUE}npm run dev${NC}"
    echo ""
    echo "  3. Open your browser to:"
    echo -e "     ${BLUE}http://localhost:5173${NC}"
    echo ""
    print_info "Happy coding! 🎉"
    echo ""
}

# Function to ask if user wants to start dev server
ask_start_dev_server() {
    echo -e "${YELLOW}Would you like to start the development server now? (y/n)${NC}"
    # shellcheck disable=SC2162
    read -p "> " answer

    if [[ "$answer" =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

# Main function
main() {
    # Print welcome message
    print_header "React Setup Script - Vite + Tailwind + DaisyUI"

    # Check prerequisites
    check_prerequisites

    # Get project name
    project_name=$(get_project_name)

    # Create Vite project
    create_vite_project "$project_name"

    # Navigate to project directory
    navigate_to_project "$project_name"

    # Install and configure Tailwind CSS
    install_tailwind
    initialize_tailwind
    setup_tailwind_css
    configure_tailwind_config

    # Install DaisyUI
    install_daisyui

    # Create demo component
    create_demo_component

    # Install dependencies
    install_dependencies

    # Display success message
    display_success_message "$project_name"

    # Ask if user wants to start dev server
    if ask_start_dev_server; then
        print_info "Starting development server..."
        echo ""
        npm run dev
    else
        print_info "You can start the development server later with: npm run dev"
    fi
}

# Run main function
main
