import React from "react";
import { useState } from "react";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import axios from "axios";
import "../assets/form.css";
import { ApiHandler } from "../api";

const DonationForm = (props) => {
  const [donation, setDonation] = useState({
    campaignId: props.campaign.id,
    name: "",
    amount: 0,
    currency: "",
  });
  const [error, setError] = useState("");

  const handleChange = (e) => {
    setDonation((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const submitDonation = (e) => {
    e.preventDefault();
    ApiHandler("/donate", "POST", donation)
      .then((response) => {
        props.close();
      })
      .catch((error) => {
        setError(error.response.data);
      });
  };

  return (
    <Form onSubmit={submitDonation}>
      {error !== "" && <p className="text-center text-danger">{error}</p>}
      <Form.Group className="mb-3">
        <Form.Label>Nick name</Form.Label>
        <Form.Control
          type="text"
          placeholder="Nick Name"
          name="name"
          onChange={handleChange}
          required
        />
      </Form.Group>

      <Form.Group className="mb-3">
        <Form.Label>Amount</Form.Label>
        <Form.Control
          type="number"
          placeholder="Amount"
          name="amount"
          min="0"
          onChange={handleChange}
        />
      </Form.Group>

      <Form.Group className="mb-3">
        <Form.Label>Currencies</Form.Label>
        <Form.Select size="lg" name="currency" onChange={handleChange} required>
          <option id="default" value="">
            Select Currency
          </option>
          {props.currencies.map((data) => (
            <option key={data.id} value={data.code}>
              {data.name}
            </option>
          ))}
        </Form.Select>
      </Form.Group>

      <Button variant="primary" type="submit">
        Submit
      </Button>
    </Form>
  );
};

export default DonationForm;
