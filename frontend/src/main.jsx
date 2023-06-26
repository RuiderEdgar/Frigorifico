import React from 'react';
import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import ReactDOM from 'react-dom/client';
import App from './App.jsx';
import { Login } from './routes/login/login.jsx';
import './global.css';
import { Home } from './routes/Home/Home.jsx';
import {DistribuidoresList} from './routes/DistribuidorList/DistribuidorList.jsx';

const router = createBrowserRouter([
	{
		path: '/',
		element: <App />
	},
	{
		path: '/login',
		element: <Login />
	},
	{
		path: '/home',
		element: <Home />
	},
	{
		path: '/home/distribuidor',
		element: <DistribuidoresList />
	}
]);

ReactDOM.createRoot(document.getElementById('root')).render(
	<React.StrictMode>
		<RouterProvider router={router} />
	</React.StrictMode>
);
