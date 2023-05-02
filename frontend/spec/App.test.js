import { render, screen } from "@testing-library/react";
import App from "../src/App";

describe("App component", () => {
  test("renders Hello World as a text", () => {
    render(<App />);

    const helloWorldElement = screen.getByText("Hello World!");
    expect(helloWorldElement).toBeInTheDocument();
  });
});
