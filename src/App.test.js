import { render, screen } from '@testing-library/react';
import App from './App';

test('renders text link', () => {
  render(<App />);
  const linkElement = screen.getByText(/blabla/i);
  expect(linkElement).toBeInTheDocument();
});
