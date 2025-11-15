# Contributing to React Setup Script

Thank you for your interest in contributing! This document provides guidelines and instructions for contributing to the React Setup Script project.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Enhancements](#suggesting-enhancements)
- [Community](#community)

---

## Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inspiring community for all. Please be respectful and constructive in your interactions.

### Our Standards

**Positive behaviors:**
- Using welcoming and inclusive language
- Being respectful of differing viewpoints
- Gracefully accepting constructive criticism
- Focusing on what's best for the community
- Showing empathy towards others

**Unacceptable behaviors:**
- Trolling, insulting/derogatory comments
- Public or private harassment
- Publishing others' private information
- Other conduct which could reasonably be considered inappropriate

---

## How Can I Contribute?

### Types of Contributions

We welcome many types of contributions:

1. **Bug Reports** - Found an issue? Let us know!
2. **Feature Requests** - Have an idea? Share it!
3. **Code Contributions** - Submit improvements or fixes
4. **Documentation** - Help improve our docs
5. **Examples** - Share projects built with this script
6. **Testing** - Help test new features
7. **Community Support** - Help answer questions

---

## Getting Started

### Prerequisites

- Git
- Node.js (v16.0.0 or higher)
- npm (v7.0.0 or higher)
- Basic knowledge of Bash scripting
- Familiarity with React, Vite, and Tailwind CSS

### Fork and Clone

1. **Fork the repository** on GitHub
2. **Clone your fork:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/react-setup-script.git
   cd react-setup-script
   ```
3. **Add upstream remote:**
   ```bash
   git remote add upstream https://github.com/stevenrhett/react-setup-script.git
   ```

### Test the Script

Before making changes, ensure the script works:

```bash
chmod +x setup-react-project.sh
./setup-react-project.sh
```

Enter a test project name and verify everything works correctly.

---

## Development Workflow

### 1. Create a Branch

Always create a new branch for your work:

```bash
git checkout -b feature/your-feature-name
```

**Branch naming conventions:**
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation changes
- `refactor/` - Code refactoring
- `test/` - Test additions or changes

**Examples:**
- `feature/add-typescript-support`
- `fix/project-name-validation`
- `docs/update-readme-examples`

### 2. Make Your Changes

Edit the files as needed. Common areas:

**Script improvements:**
- `setup-react-project.sh` - Main script

**Documentation:**
- `README.md` - Main documentation
- `FAQ.md` - Frequently asked questions
- `DOCS.md` - Technical documentation
- `CONTRIBUTING.md` - This file

### 3. Test Your Changes

**Test the script thoroughly:**

```bash
# Test with different project names
./setup-react-project.sh

# Test edge cases
# - Very long names
# - Names with special characters
# - Names with spaces
```

**Verify the generated project:**
```bash
cd test-project
npm run dev
npm run build
```

### 4. Commit Your Changes

Follow our [commit guidelines](#commit-guidelines):

```bash
git add .
git commit -m "feat: add TypeScript support to setup script"
```

### 5. Stay Updated

Keep your branch up-to-date with upstream:

```bash
git fetch upstream
git rebase upstream/main
```

### 6. Push Your Changes

```bash
git push origin feature/your-feature-name
```

---

## Coding Standards

### Bash Script Style

**General rules:**
- Use 2 spaces for indentation
- Add comments for complex logic
- Use meaningful variable names
- Always quote variables: `"$variable"`
- Check command success: `command || handle_error`

**Example:**
```bash
#!/bin/bash

# Function to validate project name
validate_project_name() {
  local project_name="$1"

  # Check if name is empty
  if [ -z "$project_name" ]; then
    echo "Error: Project name cannot be empty"
    return 1
  fi

  # Check for invalid characters
  if [[ ! "$project_name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
    echo "Error: Project name can only contain letters, numbers, hyphens, and underscores"
    return 1
  fi

  return 0
}
```

### Error Handling

Always handle potential errors:

```bash
# Bad
cd "$project_name"

# Good
cd "$project_name" || {
  echo "Error: Failed to navigate to project directory"
  exit 1
}

# Better
if ! cd "$project_name"; then
  echo "Error: Failed to navigate to project directory"
  exit 1
fi
```

### User Feedback

Provide clear feedback to users:

```bash
echo "Creating React project..."
npm create vite@latest "$project_name" -- --template react

echo "Installing Tailwind CSS..."
npm install -D tailwindcss postcss autoprefixer

echo "Configuring Tailwind..."
npx tailwindcss init -p

echo "Setup complete! Starting development server..."
npm run dev
```

---

## Commit Guidelines

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation changes
- **style**: Code style changes (formatting, no logic change)
- **refactor**: Code refactoring
- **test**: Adding or updating tests
- **chore**: Maintenance tasks

### Examples

**Feature:**
```
feat: add project name validation

- Validate project name format
- Check for existing directories
- Provide helpful error messages
```

**Bug fix:**
```
fix: handle spaces in project names

Project names with spaces were causing the script to fail.
Now properly quote variables and show error message.

Fixes #123
```

**Documentation:**
```
docs: update README with Windows instructions

Add section explaining how to run the script on Windows
using Git Bash or WSL.
```

**Refactoring:**
```
refactor: extract validation logic to function

Move project name validation to separate function
for better code organization and reusability.
```

---

## Pull Request Process

### Before Submitting

**Checklist:**
- [ ] Code follows project style guidelines
- [ ] Script has been tested thoroughly
- [ ] Documentation has been updated
- [ ] Commit messages follow conventions
- [ ] Branch is up-to-date with main

### Creating a Pull Request

1. **Push your branch:**
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Open a Pull Request** on GitHub

3. **Fill out the PR template:**
   ```markdown
   ## Description
   Brief description of changes

   ## Type of Change
   - [ ] Bug fix
   - [ ] New feature
   - [ ] Documentation update
   - [ ] Refactoring

   ## Testing
   How has this been tested?

   ## Screenshots (if applicable)
   Add screenshots here

   ## Checklist
   - [ ] Code follows style guidelines
   - [ ] Self-review completed
   - [ ] Documentation updated
   - [ ] No new warnings
   ```

### PR Review Process

1. **Automated checks** will run
2. **Maintainers** will review your code
3. **Feedback** may be provided
4. **Revisions** may be requested
5. **Approval** and merge

### After Your PR is Merged

1. **Delete your branch:**
   ```bash
   git branch -d feature/your-feature-name
   git push origin --delete feature/your-feature-name
   ```

2. **Update your local main:**
   ```bash
   git checkout main
   git pull upstream main
   ```

---

## Reporting Bugs

### Before Submitting a Bug Report

1. **Check existing issues** - Your bug may already be reported
2. **Test with latest version** - The bug may already be fixed
3. **Isolate the problem** - Create a minimal reproduction case

### Submitting a Bug Report

Use this template:

```markdown
**Bug Description**
A clear description of the bug

**Steps to Reproduce**
1. Run `./setup-react-project.sh`
2. Enter project name: 'test-project'
3. Observe error at step X

**Expected Behavior**
What should have happened

**Actual Behavior**
What actually happened

**Environment**
- OS: [e.g., macOS 13.0, Ubuntu 22.04]
- Node.js version: [e.g., 18.16.0]
- npm version: [e.g., 9.5.1]
- Shell: [e.g., bash 5.2]

**Error Messages**
```
Paste error messages here
```

**Additional Context**
Any other relevant information
```

---

## Suggesting Enhancements

### Before Submitting an Enhancement

1. **Check existing suggestions** - Your idea may already exist
2. **Consider if it fits the project scope**
3. **Think about implementation complexity**

### Submitting an Enhancement

Use this template:

```markdown
**Enhancement Description**
Clear description of the suggested feature

**Problem It Solves**
What problem does this solve?

**Proposed Solution**
How would you implement this?

**Alternatives Considered**
What other solutions did you consider?

**Additional Context**
Mockups, examples, or other context

**Implementation Complexity**
- [ ] Low - Simple change
- [ ] Medium - Moderate effort
- [ ] High - Significant work
```

---

## Enhancement Ideas

Here are some areas where contributions are especially welcome:

### Script Improvements

- **Project name validation** - Validate names before creating project
- **Template options** - Support for TypeScript, SWC, etc.
- **Interactive mode** - Choose features during setup
- **Error recovery** - Better error handling and recovery
- **Progress indicators** - Show installation progress
- **Dry run mode** - Preview what will be created
- **Silent mode** - Non-interactive installation

### Documentation

- **Video tutorial** - Walkthrough of the script
- **More examples** - Example projects using this script
- **Troubleshooting guides** - Platform-specific issues
- **Translation** - Docs in other languages
- **Architecture diagram** - Visual representation

### Testing

- **Automated tests** - Test script on different platforms
- **CI/CD integration** - GitHub Actions workflow
- **Edge case testing** - Test unusual scenarios

### Features

- **Custom templates** - Allow custom project templates
- **Plugin system** - Support for plugins/extensions
- **Configuration file** - Load defaults from config
- **Multiple frameworks** - Support Vue, Svelte, etc.

---

## Development Tips

### Testing on Different Platforms

**macOS/Linux:**
```bash
./setup-react-project.sh
```

**Windows (Git Bash):**
```bash
bash setup-react-project.sh
```

**Windows (WSL):**
```bash
wsl ./setup-react-project.sh
```

### Debugging the Script

Add debug output:

```bash
# Enable verbose mode
set -x

# Your script commands here

# Disable verbose mode
set +x
```

Print variables:

```bash
echo "DEBUG: project_name = $project_name"
echo "DEBUG: current directory = $(pwd)"
```

### Common Gotchas

1. **Quoting variables:**
   - Always use `"$variable"` not `$variable`
   - Prevents word splitting issues

2. **Error handling:**
   - Check command success: `command || handle_error`
   - Use `set -e` to exit on error (carefully!)

3. **Path issues:**
   - Use absolute paths when possible
   - Be careful with `cd` commands

4. **npm/npx versions:**
   - Different npm versions may behave differently
   - Test on multiple versions if possible

---

## Community

### Getting Help

- **GitHub Issues**: For bugs and features
- **Discussions**: For questions and ideas
- **Email**: Contact the maintainer

### Recognition

Contributors are recognized in several ways:
- Listed in contributors list
- Mentioned in release notes
- Featured in documentation (for significant contributions)

### Becoming a Maintainer

Regular contributors may be invited to become maintainers. Maintainers:
- Review pull requests
- Triage issues
- Help guide project direction
- Manage releases

---

## Questions?

If you have questions about contributing:

1. Check this guide thoroughly
2. Search existing issues and discussions
3. Open a new discussion on GitHub
4. Contact the maintainer

---

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for contributing! Your efforts help make this project better for everyone.**
