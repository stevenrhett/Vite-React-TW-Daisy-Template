# Frequently Asked Questions (FAQ)

## Table of Contents

- [General Questions](#general-questions)
- [Installation & Setup](#installation--setup)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Technology Stack](#technology-stack)
- [Deployment](#deployment)
- [Advanced Usage](#advanced-usage)

---

## General Questions

### What is this script for?

This script automates the setup of a modern React development environment with Vite, Tailwind CSS, and DaisyUI. It eliminates the repetitive manual setup process, allowing you to start coding in minutes instead of hours.

### Who should use this script?

This script is perfect for:
- Beginners learning React who want a simple setup
- Experienced developers starting new projects
- Teams wanting a standardized project structure
- Anyone prototyping or building MVPs quickly
- Developers who want to avoid manual configuration

### Is this script beginner-friendly?

Yes! The script is designed to be simple and straightforward. Even if you're new to React, you can use this script. However, basic knowledge of:
- Command line/terminal
- Node.js and npm
- JavaScript fundamentals

will be helpful.

### Is this script production-ready?

Absolutely! The script sets up a production-ready configuration with:
- Optimized build process (via Vite)
- Modern CSS framework (Tailwind CSS)
- Component library (DaisyUI)
- Best practices for file structure

However, you'll still need to:
- Add your own business logic
- Implement proper error handling
- Set up authentication/authorization
- Configure environment variables
- Set up CI/CD pipelines

### Can I use this for commercial projects?

Yes! This script is licensed under the MIT License, which allows commercial use, modification, distribution, and private use.

---

## Installation & Setup

### Do I need to install anything before running the script?

Yes, you need:
1. **Node.js** (v16.0.0 or higher) - [Download here](https://nodejs.org/)
2. **npm** (comes with Node.js)
3. **Git** (optional, for cloning the repository)

### What operating systems are supported?

- **Linux**: Fully supported
- **macOS**: Fully supported
- **Windows**: Supported via Git Bash or WSL (Windows Subsystem for Linux)

### How much disk space do I need?

You'll need approximately:
- **50MB** for the script and initial setup
- **300-500MB** for node_modules (dependencies)
- **Total: ~550MB** per project

### Can I run this script multiple times?

Yes! Each time you run the script, it creates a new project in a separate directory. You can create as many projects as you want.

### What if I already have a project with the same name?

The script will fail if a directory with that name already exists. You'll need to either:
- Choose a different project name
- Delete or rename the existing directory
- Move to a different location

---

## Customization

### Can I use TypeScript instead of JavaScript?

Yes! After creating your project, you can add TypeScript support:

```bash
cd your-project-name
npm install --save-dev typescript @types/react @types/react-dom
```

Then rename your files:
- `App.jsx` → `App.tsx`
- `main.jsx` → `main.tsx`

And create a `tsconfig.json`:

```json
{
  "compilerOptions": {
    "target": "ES2020",
    "useDefineForClassFields": true,
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true
  },
  "include": ["src"],
  "references": [{ "path": "./tsconfig.node.json" }]
}
```

### Can I modify the script for my specific needs?

Absolutely! The script is open source and easy to modify. Common modifications:
- Adding different libraries (React Router, Redux, etc.)
- Changing the default component structure
- Adding ESLint and Prettier
- Setting up different CSS frameworks

See [DOCS.md](DOCS.md) for detailed customization guides.

### What if I don't want DaisyUI?

You can remove DaisyUI after project creation:

```bash
npm uninstall daisyui
```

Then edit `tailwind.config.js` and remove the DaisyUI plugin:

```javascript
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [], // Remove require("daisyui")
}
```

### Can I use a different CSS framework?

Yes! You can:
- **Remove Tailwind entirely** and use plain CSS, CSS Modules, or styled-components
- **Keep Tailwind** and add another framework
- **Replace Tailwind** with Bootstrap, Material-UI, Chakra UI, etc.

### How do I add React Router?

After project creation, install React Router:

```bash
npm install react-router-dom
```

Then set up routes in your `App.jsx`:

```jsx
import { BrowserRouter, Routes, Route } from 'react-router-dom';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/about" element={<AboutPage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
```

### How do I add state management (Redux, Zustand, etc.)?

Install your preferred state management library:

**Redux Toolkit:**
```bash
npm install @reduxjs/toolkit react-redux
```

**Zustand:**
```bash
npm install zustand
```

**React Query:**
```bash
npm install @tanstack/react-query
```

See the respective documentation for setup instructions.

---

## Troubleshooting

### The script says "Permission denied"

On Linux/macOS, make the script executable:

```bash
chmod +x setup-react-project.sh
```

On Windows, use Git Bash or run:

```bash
bash setup-react-project.sh
```

### npm install is taking forever

This is normal for the first install as npm downloads all dependencies. Typical install times:
- Fast internet: 2-5 minutes
- Slow internet: 5-15 minutes

If it's stuck:
1. Check your internet connection
2. Try clearing npm cache: `npm cache clean --force`
3. Delete `node_modules` and `package-lock.json`, then reinstall

### The development server won't start

Common solutions:
1. **Port in use**: Vite will automatically try another port
2. **Node version**: Ensure you have Node.js v16.0.0 or higher
3. **Corrupted install**: Delete `node_modules` and run `npm install` again
4. **Firewall**: Check if your firewall is blocking the port

### I see "Module not found" errors

This usually means:
1. Dependencies weren't installed properly - run `npm install`
2. You're importing a file that doesn't exist - check your import paths
3. You deleted a necessary file - check what file is missing

### Tailwind styles aren't working

Check these:
1. **index.css imported**: Make sure `index.css` is imported in `main.jsx`
2. **Tailwind directives**: Ensure `index.css` has the three @tailwind directives
3. **Content paths**: Check `tailwind.config.js` has correct content paths
4. **Build process**: Restart the dev server (`Ctrl+C` then `npm run dev`)

### DaisyUI components don't look right

1. **Theme not set**: DaisyUI uses `light` theme by default
2. **Missing classes**: Check [DaisyUI documentation](https://daisyui.com/) for correct class names
3. **Plugin not loaded**: Verify `tailwind.config.js` includes `require("daisyui")`

### Hot Module Replacement (HMR) not working

1. **Restart dev server**: Stop (`Ctrl+C`) and run `npm run dev` again
2. **File watchers**: You may have hit system file watcher limits (common on Linux)
3. **Save files properly**: Ensure your editor is actually saving files
4. **Browser cache**: Clear browser cache and hard reload (`Ctrl+Shift+R`)

---

## Technology Stack

### Why Vite instead of Create React App?

Vite offers several advantages:
- **Faster startup**: Uses native ES modules
- **Faster HMR**: Updates are near-instant
- **Better performance**: Optimized build process
- **Modern**: Built for modern development
- **Active development**: Create React App is deprecated

### Why Tailwind CSS?

Tailwind CSS provides:
- **Utility-first**: Rapid UI development
- **Customizable**: Easy to configure
- **Small bundle size**: Unused styles are purged
- **No naming conflicts**: No need to think of class names
- **Great ecosystem**: Tons of plugins and resources

### Why DaisyUI?

DaisyUI adds:
- **Pre-built components**: Buttons, cards, modals, etc.
- **30+ themes**: Easy theme switching
- **Semantic class names**: More readable than pure Tailwind
- **Accessibility**: Components are accessible by default
- **Small size**: Only ~2KB gzipped

### What version of React is used?

The script uses the latest stable version of React (React 18+ as of writing). Vite's React template is always kept up-to-date.

### Can I use this with Next.js or Remix?

This script is specifically for Vite + React (single-page applications). For Next.js or Remix:
- **Next.js**: Use `npx create-next-app@latest`
- **Remix**: Use `npx create-remix@latest`

Both support Tailwind CSS and can use DaisyUI.

---

## Deployment

### How do I deploy my project?

Build your project first:

```bash
npm run build
```

This creates a `dist` folder with optimized files. Deploy options:

**Vercel:**
```bash
npm install -g vercel
vercel
```

**Netlify:**
```bash
npm install -g netlify-cli
netlify deploy
```

**GitHub Pages:**
```bash
npm install -g gh-pages
npm run build
gh-pages -d dist
```

See [DOCS.md](DOCS.md) for detailed deployment guides.

### Do I need to configure anything for production?

The Vite configuration is production-ready by default. However, consider:
- Setting up environment variables
- Configuring base URL if deploying to a subdirectory
- Adding error tracking (Sentry, LogRocket)
- Setting up analytics
- Optimizing images and assets

### What's the difference between `npm run dev` and `npm run build`?

- **`npm run dev`**: Development server with HMR, not optimized
- **`npm run build`**: Production build, optimized and minified

Always use `npm run build` for production deployments.

### How do I set up environment variables?

Create a `.env` file in your project root:

```
VITE_API_URL=https://api.example.com
VITE_API_KEY=your-api-key
```

Access in your code:

```javascript
const apiUrl = import.meta.env.VITE_API_URL;
```

Important:
- Prefix with `VITE_` to expose to client
- Never commit sensitive keys to git
- Use different `.env` files for different environments

---

## Advanced Usage

### Can I add ESLint and Prettier?

Yes! After project creation:

```bash
npm install --save-dev eslint prettier eslint-config-prettier eslint-plugin-react
```

Create `.eslintrc.json`:

```json
{
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended",
    "prettier"
  ],
  "plugins": ["react"],
  "parserOptions": {
    "ecmaVersion": 2021,
    "sourceType": "module",
    "ecmaFeatures": {
      "jsx": true
    }
  },
  "rules": {
    "react/react-in-jsx-scope": "off"
  },
  "settings": {
    "react": {
      "version": "detect"
    }
  }
}
```

Create `.prettierrc`:

```json
{
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5"
}
```

### How do I add testing (Jest, Vitest)?

Install Vitest (recommended for Vite projects):

```bash
npm install --save-dev vitest @testing-library/react @testing-library/jest-dom
```

Add to `package.json`:

```json
{
  "scripts": {
    "test": "vitest"
  }
}
```

Create tests in `src/__tests__/` or alongside components as `*.test.jsx`.

### Can I customize the Vite configuration?

Yes! Edit `vite.config.js`:

```javascript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    port: 3000, // Custom port
    open: true, // Auto-open browser
  },
  build: {
    outDir: 'build', // Custom output directory
  },
});
```

### How do I add path aliases?

Edit `vite.config.js`:

```javascript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'path';

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
      '@components': path.resolve(__dirname, './src/components'),
    },
  },
});
```

Then import with:

```javascript
import Button from '@components/Button';
```

### How do I add PWA support?

Install the Vite PWA plugin:

```bash
npm install --save-dev vite-plugin-pwa
```

Configure in `vite.config.js`:

```javascript
import { VitePWA } from 'vite-plugin-pwa';

export default defineConfig({
  plugins: [
    react(),
    VitePWA({
      registerType: 'autoUpdate',
      manifest: {
        name: 'My App',
        short_name: 'App',
        theme_color: '#ffffff',
      },
    }),
  ],
});
```

---

## Still Have Questions?

If your question isn't answered here:

1. Check the [Documentation](DOCS.md)
2. Search [GitHub Issues](https://github.com/stevenrhett/react-setup-script/issues)
3. Open a new issue with your question
4. Check the official documentation:
   - [React](https://react.dev/)
   - [Vite](https://vitejs.dev/)
   - [Tailwind CSS](https://tailwindcss.com/)
   - [DaisyUI](https://daisyui.com/)

---

**Last Updated**: November 2025
