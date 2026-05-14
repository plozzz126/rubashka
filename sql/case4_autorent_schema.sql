CREATE TABLE car_categories (
    category_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    daily_rate NUMERIC(10,2) NOT NULL CHECK (daily_rate >= 0)
);

CREATE TABLE branches (
    branch_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    city VARCHAR(80) NOT NULL,
    address_line VARCHAR(255) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    working_hours VARCHAR(80),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE clients (
    client_id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    phone VARCHAR(30) NOT NULL UNIQUE,
    email VARCHAR(120) UNIQUE,
    driver_license_no VARCHAR(50) NOT NULL UNIQUE,
    license_expiry_date DATE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE employees (
    employee_id BIGSERIAL PRIMARY KEY,
    branch_id BIGINT NOT NULL REFERENCES branches(branch_id),
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    role VARCHAR(40) NOT NULL,
    phone VARCHAR(30) UNIQUE,
    email VARCHAR(120) UNIQUE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    hired_at DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE cars (
    car_id BIGSERIAL PRIMARY KEY,
    category_id BIGINT NOT NULL REFERENCES car_categories(category_id),
    branch_id BIGINT NOT NULL REFERENCES branches(branch_id),
    plate_number VARCHAR(20) NOT NULL UNIQUE,
    brand VARCHAR(80) NOT NULL,
    model VARCHAR(80) NOT NULL,
    production_year SMALLINT NOT NULL CHECK (production_year BETWEEN 1990 AND 2100),
    vin VARCHAR(50) UNIQUE,
    status VARCHAR(20) NOT NULL CHECK (status IN ('available', 'reserved', 'rented', 'service')),
    daily_price NUMERIC(10,2) NOT NULL CHECK (daily_price >= 0),
    mileage_km INTEGER NOT NULL DEFAULT 0 CHECK (mileage_km >= 0)
);

CREATE TABLE bookings (
    booking_id BIGSERIAL PRIMARY KEY,
    client_id BIGINT NOT NULL REFERENCES clients(client_id),
    car_id BIGINT NOT NULL REFERENCES cars(car_id),
    pickup_branch_id BIGINT NOT NULL REFERENCES branches(branch_id),
    return_branch_id BIGINT NOT NULL REFERENCES branches(branch_id),
    created_by_employee_id BIGINT REFERENCES employees(employee_id),
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    total_amount NUMERIC(10,2) NOT NULL CHECK (total_amount >= 0),
    status VARCHAR(20) NOT NULL CHECK (status IN ('new', 'confirmed', 'active', 'completed', 'cancelled')),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CHECK (end_date > start_date)
);

CREATE TABLE payments (
    payment_id BIGSERIAL PRIMARY KEY,
    booking_id BIGINT NOT NULL REFERENCES bookings(booking_id) ON DELETE CASCADE,
    processed_by_employee_id BIGINT REFERENCES employees(employee_id),
    amount NUMERIC(10,2) NOT NULL CHECK (amount > 0),
    payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('cash', 'card', 'transfer', 'online')),
    payment_status VARCHAR(20) NOT NULL CHECK (payment_status IN ('pending', 'paid', 'failed', 'refunded')),
    transaction_ref VARCHAR(100),
    paid_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE car_inspections (
    inspection_id BIGSERIAL PRIMARY KEY,
    car_id BIGINT NOT NULL REFERENCES cars(car_id),
    booking_id BIGINT REFERENCES bookings(booking_id),
    employee_id BIGINT NOT NULL REFERENCES employees(employee_id),
    inspection_type VARCHAR(20) NOT NULL CHECK (inspection_type IN ('pickup', 'return', 'periodic')),
    fuel_level_percent SMALLINT CHECK (fuel_level_percent BETWEEN 0 AND 100),
    mileage_km INTEGER CHECK (mileage_km >= 0),
    condition_status VARCHAR(20) NOT NULL CHECK (condition_status IN ('ok', 'minor_damage', 'major_damage')),
    damage_notes TEXT,
    inspected_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Recommended indexes from the task
CREATE INDEX idx_cars_category_id ON cars(category_id);
CREATE INDEX idx_bookings_client_id ON bookings(client_id);
CREATE INDEX idx_bookings_car_id ON bookings(car_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Useful extra indexes
CREATE INDEX idx_bookings_car_start_end ON bookings(car_id, start_date, end_date);
CREATE INDEX idx_cars_branch_id ON cars(branch_id);
CREATE INDEX idx_car_inspections_car_id ON car_inspections(car_id);
