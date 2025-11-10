-- ==============================
-- USERS
-- ==============================
INSERT INTO users (id, name, email)
VALUES
  ('11111111-1111-1111-1111-111111111111', 'Alice Johnson', 'alice@example.com'),
  ('22222222-2222-2222-2222-222222222222', 'Bob Smith', 'bob@example.com'),
  ('33333333-3333-3333-3333-333333333333', 'Charlie Brown', 'charlie@example.com');

-- ==============================
-- DEVICES
-- ==============================
INSERT INTO devices (id, serial_number, model, order_id, install_status, device_type)
VALUES
  ('44444444-4444-4444-4444-444444444444', 'SN-001', 'Dell Latitude 7420', 'ORD-001', 'deployed', 'computer'),
  ('55555555-5555-5555-5555-555555555555', 'SN-002', 'HP Z24n G3', 'ORD-002', 'in_inventory', 'monitor'),
  ('66666666-6666-6666-6666-666666666666', 'SN-003', 'Lenovo ThinkPad X1', 'ORD-003', 'deployed', 'computer');

-- ==============================
-- RELATIONS
-- ==============================
INSERT INTO relations (id, user_id, device_id, start_date, end_date)
VALUES
  ('77777777-7777-7777-7777-777777777777', '11111111-1111-1111-1111-111111111111', '44444444-4444-4444-4444-444444444444', NOW() - INTERVAL '6 months', NULL),
  ('88888888-8888-8888-8888-888888888888', '22222222-2222-2222-2222-222222222222', '55555555-5555-5555-5555-555555555555', NOW() - INTERVAL '2 months', NOW() - INTERVAL '1 month');

-- ==============================
-- TICKETS
-- ==============================
INSERT INTO tickets (id, number, title, description, status, caller_id, operator_id, estimated_resolution_date)
VALUES
  ('99999999-9999-9999-9999-999999999999', 1001, 'Laptop not booting', 'User reports that laptop does not boot properly.', 'in_progress', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', NOW() + INTERVAL '3 days'),
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 1002, 'Monitor flickering', 'Screen flickers randomly.', 'new', '22222222-2222-2222-2222-222222222222', NULL, NOW() + INTERVAL '5 days'),
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 1003, 'Software installation', 'Need installation of new CRM software.', 'resolved', '33333333-3333-3333-3333-333333333333', '11111111-1111-1111-1111-111111111111', NOW() - INTERVAL '10 days');

-- ==============================
-- WORKNOTES
-- ==============================
INSERT INTO worknotes (id, note, author_id, ticket_id)
VALUES
  ('cccccccc-cccc-cccc-cccc-cccccccccccc', 'Investigating possible hardware issue.', '22222222-2222-2222-2222-222222222222', '99999999-9999-9999-9999-999999999999'),
  ('dddddddd-dddd-dddd-dddd-dddddddddddd', 'Waiting for replacement part.', '22222222-2222-2222-2222-222222222222', '99999999-9999-9999-9999-999999999999'),
  ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'Issue resolved after reinstalling drivers.', '11111111-1111-1111-1111-111111111111', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb');