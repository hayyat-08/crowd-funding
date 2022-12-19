import React from "react";
import Modal from "react-bootstrap/Modal";
import DonationForm from "./Form";

const ModalBox = (props) => {
  return (
    <>
      <Modal
        show={props.show}
        onHide={props.handleClose}
        backdrop="static"
        keyboard={false}
      >
        <Modal.Header closeButton>
          <Modal.Title>Necessary Information For Donation</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <DonationForm
            campaign={props.campaign}
            close={props.handleClose}
            currencies={props.currencies}
          />
        </Modal.Body>
      </Modal>
    </>
  );
};

export default ModalBox;
