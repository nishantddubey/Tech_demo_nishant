import '../styles/globals.css';
import Layout from '../components/Layout';
import { useEffect, useState } from 'react';
import { useRouter } from 'next/router';
import { isAuthenticated } from '../lib/auth';

function MyApp({ Component, pageProps }) {
  const [csrfToken, setCsrfToken] = useState('');
  const router = useRouter();
  const isAuthPage = router.pathname === '/login' || router.pathname === '/register';

  useEffect(() => {
    const fetchCsrfToken = async () => {
      try {
        const res = await fetch('http://192.168.49.2:30001/api/csrf-token/');
        if (!res.ok) {
          throw new Error(`HTTP error! status: ${res.status}`);
        }
        const data = await res.json();
        setCsrfToken(data.csrfToken);
        window.csrfToken = data.csrfToken;
      } catch (error) {
        console.error('Error fetching CSRF token:', error);
      }
    };

    fetchCsrfToken();

    // Redirect based on authentication status
    if (!isAuthenticated() && !isAuthPage) {
      router.push('/login');
    }
  }, [router, isAuthPage]);

  return isAuthPage ? (
    <Component {...pageProps} csrfToken={csrfToken} />
  ) : (
    <Layout>
      <Component {...pageProps} csrfToken={csrfToken} />
    </Layout>
  );
}

export default MyApp;
