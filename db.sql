-- Hospital Management Database Schema

-- 1. Departments
CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    description TEXT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 2. Patients
CREATE TABLE patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    contact_number VARCHAR(20),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 3. Doctors
CREATE TABLE doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    gender ENUM('Male', 'Female', 'Other'),
    specialization VARCHAR(100),
    department_id INT,
    photo_url VARCHAR(255),
    availability TEXT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 4. Nurses
CREATE TABLE nurses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    gender ENUM('Male', 'Female', 'Other'),
    department_id INT,
    shift VARCHAR(50),
    FOREIGN KEY (department_id) REFERENCES departments(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 5. Staff
CREATE TABLE staff (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    full_name VARCHAR(100),
    role VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 6. Services
CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    department_id INT,
    icon_class VARCHAR(100),
    FOREIGN KEY (department_id) REFERENCES departments(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 7. Wards
CREATE TABLE wards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    name VARCHAR(100),
    type ENUM('General', 'Private', 'ICU', 'Maternity'),
    total_beds INT,
    available_beds INT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 8. Appointments
CREATE TABLE appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status ENUM('Pending', 'Confirmed', 'Completed', 'Cancelled') DEFAULT 'Pending',
    reason TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 9. Prescriptions
CREATE TABLE prescriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    appointment_id INT,
    doctor_id INT,
    patient_id INT,
    prescribed_on DATE,
    notes TEXT,
    FOREIGN KEY (appointment_id) REFERENCES appointments(id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id),
    FOREIGN KEY (patient_id) REFERENCES patients(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 10. Lab Reports
CREATE TABLE lab_reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    patient_id INT,
    appointment_id INT,
    test_type VARCHAR(100),
    result TEXT,
    report_date DATE,
    status ENUM('Pending', 'Completed'),
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 11. Billing
CREATE TABLE billing (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    patient_id INT,
    appointment_id INT,
    amount DECIMAL(10,2),
    payment_method ENUM('Cash', 'Card', 'Online'),
    payment_status ENUM('Unpaid', 'Paid', 'Pending') DEFAULT 'Unpaid',
    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 12. Reviews
CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    patient_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 13. Blogs
CREATE TABLE blogs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    author VARCHAR(100),
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 14. Contacts
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    name VARCHAR(100),
    email VARCHAR(100),
    subject VARCHAR(150),
    message TEXT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 15. Admins
CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    role ENUM('Admin', 'Manager') DEFAULT 'Admin',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
