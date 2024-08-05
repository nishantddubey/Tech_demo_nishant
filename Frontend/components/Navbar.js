import Link from 'next/link';
import { useRouter } from 'next/router';
import styles from './Navbar.module.css';
import { useState, useEffect } from 'react';

const Navbar = () => {
  const router = useRouter();
  const [username, setUsername] = useState('');

  useEffect(() => {
    // Retrieve the username from local storage
    const storedUsername = localStorage.getItem('username');
    if (storedUsername) {
      setUsername(storedUsername);
    }
  }, []);

  const handleLogout = () => {
    // Remove the auth token and username from local storage
    localStorage.removeItem('authToken');
    localStorage.removeItem('username');
    // Redirect to login page
    router.push('/login');
  };

  return (
    <nav className={styles.navbar}>
      <ul className={styles.navList}>
        <li><Link href="/">Home</Link></li>
        <li><Link href="/daily-closing-prices">Daily Closing Prices</Link></li>
        <li><Link href="/price-change-percentages">Price Change Percentages</Link></li>
        <li><Link href="/top-gainers-losers">Top Gainers/Losers</Link></li>
        <li><Link href="/stocks">Stocks Data History</Link></li>
        <li>
          <a href="http://192.168.49.2:31001/dashboards/" target="_blank" rel="noopener noreferrer" className={styles.navLink}>
            Dashboard
          </a>
        </li>
      </ul>
      <div className={styles.userInfo}>
        {username && <span className={styles.welcomeMessage}>Welcome {username},</span>}
        <button onClick={handleLogout} className={styles.logoutButton}>Logout</button>
      </div>
    </nav>
  );
};

export default Navbar;
