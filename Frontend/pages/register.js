import { useState } from 'react';
import Router from 'next/router';
import styles from '../styles/Register.module.css'; // Import the CSS module

const Register = ({ csrfToken }) => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const res = await fetch('http://192.168.49.2:30001/api/register/', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken': csrfToken,
        },
        body: JSON.stringify({ username, password, confirm_password: confirmPassword }),
      });

      if (res.ok) {
        Router.push('/login'); // Redirect to login on successful registration
      } else {
        const data = await res.json();
        setError(data.error || 'Error during registration');
      }
    } catch (error) {
      setError('Error during registration');
      console.error('Error during registration:', error);
    }
  };

  return (
    <div><h2 className={styles.welcome}>Register now to start Stock Monitoring with our comprehensive dashboard</h2>
    <div className={styles.container}>
      <div className={styles.formContainer}>
        <h1 className={styles.title}>Register</h1>
        <form onSubmit={handleSubmit}>
          <div className={styles.label}>
            <span>Username:</span>
            <input
              className={styles.inputField}
              type="text"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              required
            />
          </div>
          <div className={styles.label}>
            <span>Password:</span>
            <input
              className={styles.inputField}
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>
          <div className={styles.label}>
            <span>Confirm Password:</span>
            <input
              className={styles.inputField}
              type="password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              required
            />
          </div>
          <button type="submit" className={styles.submitButton}>Register</button>
          {error && <p className={styles.error}>{error}</p>}
        </form>
        <p className={styles.registerLink}>
          Already have an account? <a href="/login">Login here</a>
        </p>
      </div>
    </div>
    </div>
  );
};

export default Register;
