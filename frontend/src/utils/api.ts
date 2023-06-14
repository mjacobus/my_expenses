import UserData from "../types/UserData";
import { ExpensesResponse } from "../types/api";

function createUrl(path: string, params: any): URL {
  const location = window.location;
  const url = new URL(`${location.protocol}${location.host}/api/expenses`);

  if (params) {
    url.search = new URLSearchParams(params).toString();
  }

  return url;
}

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

interface FetchExpensesProps {
  limit?: number;
  page?: number;
}

async function fetchExpenses({
  limit = 100,
  page = 1,
}: FetchExpensesProps): Promise<ExpensesResponse | null> {
  console.log(`[API]: fetchExpenses(page = ${page}, limit = ${limit})`);
  const url = createUrl("/api/expenses", { page, limit });
  const response = await fetch(url, {
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
  fetchExpenses,
};
