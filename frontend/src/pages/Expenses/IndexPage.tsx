import React, { useState, useEffect } from "react";
import Alert from "@mui/material/Alert";
import api from "../../utils/api";

function ExpenseItem({ item }) {
  return (
    <li>
      <span> {item.description}</span>
      <span> {item.amount}</span>
      <span> {item.expensed_at}</span>
    </li>
  );
}

function Expenses({ expenses }) {
  return (
    <ul>
      {expenses.map((expense) => (
        <ExpenseItem item={expense} key={expense.id} />
      ))}
    </ul>
  );
}

function Page({ children }) {
  return (
    <>
      <h1>Minhas despesas</h1>
      {children}
    </>
  );
}

export default function IndexPage() {
  const [expenses, setExpenses] = useState([]);
  const [loading, setLoading] = useState(true);

  const fetchData = async () => {
    const response = await api.fetchExpenses();
    setExpenses(response.data);
    setLoading(false);
  };

  useEffect(() => {
    fetchData();
  }, []);

  if (loading) {
    return (
      <Page>
        <Alert>Loading</Alert>
      </Page>
    );
  }

  return (
    <Page>
      <Expenses expenses={expenses} />
    </Page>
  );
}
