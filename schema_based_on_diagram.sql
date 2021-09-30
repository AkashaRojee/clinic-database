CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  date_of_birth DATE,
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at timestamp,
  patient_id INT,
  status VARCHAR(250),
  FOREIGN KEY (patient_id) REFERENCES patients(id),
  PRIMARY kEY (id)
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  PRIMARY kEY (id)
);

CREATE TABLE treatments(
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(100),
  name VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories_treatments(
  id INT GENERATED ALWAYS AS IDENTITY,
  medical_histories_id INT,
  treatments_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatments_id) REFERENCES treatments(id)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  PRIMARY kEY(id),
  FOREIGN kEY (invoice_id) REFERENCES invoices(id),
  FOREIGN kEY (treatment_id) REFERENCES treatments(id)
);


CREATE INDEX inx_medical_histories_patients_id ON medical_histories(patient_id);
CREATE INDEX inx_invoice_invoice_items_id ON invoice_items(invoice_id);
CREATE INDEX inx_treatment_invoice_items_id ON invoice_items(treatment_id);
CREATE INDEX inx_invoices_medical_history_id ON invoices(medical_history_id);
CREATE INDEX inx_medical_histories_medical_histories_treatments_id ON medical_histories_treatments(medical_histories_id);
CREATE INDEX inx_treatments_id_medical_histories_treatments_id ON medical_histories_treatments(treatments_id);








