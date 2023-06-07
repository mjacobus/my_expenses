import React, { useState, useEffect } from "react";
import Alert from "@mui/material/Alert";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableRow from "@mui/material/TableRow";
import api from "../../utils/api";

function ExpenseItem({ item }) {
  return (
    <TableRow>
      <TableCell>{item.id}</TableCell>
      <TableCell>{item.descripiton}</TableCell>
      <TableCell>{item.amount}</TableCell>
      <TableCell>{item.expensed_at}</TableCell>
    </TableRow>
  );
}

function Expenses({ expenses }) {
  return (
    <Table>
      <TableBody>
        {expenses.map((expense) => (
          <ExpenseItem item={expense} key={expense.id} />
        ))}
      </TableBody>
    </Table>
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
