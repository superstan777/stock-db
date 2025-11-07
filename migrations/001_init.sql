-- ==============================
-- ENUMS
-- ==============================
CREATE TYPE device_type AS ENUM ('computer', 'monitor');
CREATE TYPE install_status AS ENUM ('deployed', 'in_inventory', 'end_of_life', 'disposed');
CREATE TYPE ticket_status AS ENUM ('new', 'in_progress', 'on_hold', 'resolved', 'cancelled');

-- ==============================
-- TABLE: users
-- ==============================
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- ==============================
-- TABLE: devices
-- ==============================
CREATE TABLE devices (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  serial_number TEXT NOT NULL UNIQUE,
  model TEXT NOT NULL,
  order_id TEXT NOT NULL,
  install_status install_status NOT NULL,
  device_type device_type NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ==============================
-- TABLE: tickets
-- ==============================
CREATE TABLE tickets (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  number SERIAL NOT NULL UNIQUE,
  title TEXT NOT NULL,
  description TEXT,
  status ticket_status NOT NULL DEFAULT 'new',
  caller_id UUID REFERENCES users(id) ON DELETE SET NULL,
  assigned_to UUID REFERENCES users(id) ON DELETE SET NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
  estimated_resolution_date TIMESTAMP WITH TIME ZONE,
  resolution_date TIMESTAMP WITH TIME ZONE
);

-- ==============================
-- TABLE: relations
-- ==============================
CREATE TABLE relations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  device_id UUID NOT NULL REFERENCES devices(id) ON DELETE CASCADE,
  start_date TIMESTAMP WITH TIME ZONE NOT NULL,
  end_date TIMESTAMP WITH TIME ZONE
);

-- ==============================
-- TABLE: worknotes
-- ==============================
CREATE TABLE worknotes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  note TEXT NOT NULL,
  author_id UUID REFERENCES users(id) ON DELETE SET NULL,
  ticket_id UUID REFERENCES tickets(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- ==============================
-- INDEXES
-- ==============================
CREATE INDEX idx_devices_serial_number ON devices(serial_number);
CREATE INDEX idx_tickets_status ON tickets(status);
CREATE INDEX idx_relations_user_id ON relations(user_id);
CREATE INDEX idx_relations_device_id ON relations(device_id);
CREATE INDEX idx_worknotes_ticket_id ON worknotes(ticket_id);