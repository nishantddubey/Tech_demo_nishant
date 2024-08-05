import { useEffect } from 'react';
import { useRouter } from 'next/router';
import { isAuthenticated } from '../utils/auth';

const withAuth = (WrappedComponent) => {
  return (props) => {
    const router = useRouter();

    useEffect(() => {
      if (!isAuthenticated()) {
        router.push('/login'); // Redirect to login if not authenticated
      }
    }, []);

    if (!isAuthenticated()) {
      return null; // Render nothing until redirect
    }

    return <WrappedComponent {...props} />;
  };
};

export default withAuth;
