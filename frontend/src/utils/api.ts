import UserData from "../types/UserData";

async function fetchUserSession(): Promise<UserData | null> {
  console.log("[API]: fetchUserSession()");
  const response = await fetch("/api/session", {
    headers: {
      "Content-Type": "application/json",
    },
  });

  if (response.ok) {
    return response.json();
  }

  return null;
}

export default {
  fetchUserSession,
};
