import { useState } from 'react';
import Router from 'next/router';
import styles from '../styles/Login.module.css'; // Import the CSS module

const Login = ({ csrfToken }) => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const res = await fetch('http://192.168.49.2:30001/api/login/', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken': csrfToken,
        },
        body: JSON.stringify({ username, password }),
      });

      if (res.ok) {
        const data = await res.json();
        localStorage.setItem('authToken', data.token); // Store token from response
        localStorage.setItem('username', username); // Store username
        Router.push('/'); // Redirect to home page on successful login
      } else {
        const data = await res.json();
        setError(data.error || 'Error during login');
      }
    } catch (error) {
      setError('Error during login');
      console.error('Error during login:', error);
    }
  };

  return (
    <div><h2 className={styles.welcome}>Welcome Back! Please log in to access your Stock Monitoring Dashboard.</h2>
    <div className={styles.container}>
      <div className={styles.formContainer}>
        <h1 className={styles.title}>Login</h1>
        <form onSubmit={handleSubmit}>
          <label className={styles.label}>
            <span>Username</span>
            <input
              type="text"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              required
              className={styles.inputField}
            />
          </label>
          <label className={styles.label}>
            <span>Password</span>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
              className={styles.inputField}
            />
          </label>
          <button type="submit" className={styles.submitButton}>Login</button>
          {error && <p className={styles.error}>{error}</p>}
        </form>
        <p className={styles.registerLink}>
          Don't have an account? <a href="/register">Register here</a>
        </p>
      </div>
    </div>
    </div>
  );
};

export default Login;
