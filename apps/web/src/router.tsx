import { createBrowserRouter } from 'react-router'
import App from './App.tsx'
import HomePage from './pages/HomePage.tsx'

export const routes = [
  {
    path: '/',
    element: <App />,
    children: [{ index: true, element: <HomePage /> }],
  },
]

export const router = createBrowserRouter(routes)
