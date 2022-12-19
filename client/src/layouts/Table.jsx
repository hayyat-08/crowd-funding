import React, { useState, useEffect } from "react";
import Button from "react-bootstrap/Button";
import Container from "react-bootstrap/Container";
import Spinner from "react-bootstrap/Spinner";
import axios from "axios";
import ModalBox from "./Modal";
import "../assets/table.css";
import { ApiHandler } from "../api";

const TableLayout = (props) => {
  const [campaign, setCampaign] = useState([]);
  const [currencies, setCurrencies] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [show, setShow] = useState(false);
  const [selectedCampaign, setSelectedCampaign] = useState({});

  useEffect(() => {
    fetchAllCampaign();
    fetchAllCurrencies();
  }, []);

  const fetchAllCampaign = () => {
    setLoading(true);
    ApiHandler("/", "GET")
      .then((res) => {
        setCampaign(res.data);
        setLoading(false);
      })
      .catch((err) => {
        setError(err.response.data);
        setLoading(false);
      });
  };

  const fetchAllCurrencies = () => {
    setLoading(true);
    ApiHandler("/currencies", "GET")
      .then((res) => {
        setCurrencies(res.data);
        setLoading(false);
      })
      .catch((err) => {
        setError(err.response.data);
        setLoading(false);
      });
  };

  const handleShow = (data) => {
    setShow(true);
    setSelectedCampaign(data);
  };
  const handleClose = () => {
    fetchAllCampaign();
    setShow(false);
  };

  const scrolling = () => {};

  return (
    <Container fluid>
      {error !== "" ? (
        <p className="text-center text-danger">Something went wrong</p>
      ) : loading ? (
        <Spinner animation="border" role="status">
          <span className="visually-hidden">Loading...</span>
        </Spinner>
      ) : (
        <div className="table-responsive-vertical">
          <table
            id="table"
            className="table table-hover table-mc-light-blue"
            onScroll={scrolling}
          >
            <thead>
              <tr>
                <th>Sr:</th>
                <th>Name</th>
                <th>Description</th>
                <th>Amount</th>
                <th>Donate</th>
              </tr>
            </thead>
            <tbody>
              {campaign.map((data) => (
                <tr key={data.id}>
                  <td>{data.id}</td>
                  <td>{data.name}</td>
                  <td>{data.description}</td>
                  <td>{data.amount}</td>
                  <td>
                    <Button variant="primary" onClick={() => handleShow(data)}>
                      Donate
                    </Button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
      {show && (
        <ModalBox
          show
          campaign={selectedCampaign}
          handleClose={handleClose}
          currencies={currencies}
        />
      )}
    </Container>
  );
};

export default TableLayout;
