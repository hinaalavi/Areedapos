--    uniCenta oPOS - Touch Friendly Point Of Sale
--    Copyright (c) 2009-2017 uniCenta
--    https://unicenta.com
--
--    This file is part of uniCenta oPOS.
--
--    uniCenta oPOS is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    uniCenta oPOS is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with uniCenta oPOS.  If not, see <http://www.gnu.org/licenses/>.

-- Database upgrade script for MySQL
-- v4.5.1 - v4.5.2 17FEB2018

--
-- CLEAR THE DECKS
--
DELETE FROM sharedtickets;

set foreign_key_checks = 0;

-- RECREATE applications --
DROP TABLE `applications`;
CREATE TABLE IF NOT EXISTS `applications` (
	`id` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`version` varchar(255) NOT NULL,
	`instdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY  ( `id` )
) ENGINE = InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT = Compact;

INSERT INTO applications(id, name, version) VALUES($APP_ID{}, $APP_NAME{}, $APP_VERSION{});

DELETE FROM roles WHERE id = '0';
INSERT INTO roles(id, name, permissions) VALUES('0', 'Administrator role', $FILE{/com/openbravo/pos/templates/Role.Administrator.xml} );

set foreign_key_checks = 1;

TRUNCATE resources;

-- SYSTEM
INSERT INTO resources(id, name, restype, content) VALUES('00', 'Menu.Root', 0, $FILE{/com/openbravo/pos/templates/Menu.Root.txt});
INSERT INTO resources(ID, name, restype, content) VALUES('01', 'Application.Started', 0, $FILE{/com/openbravo/pos/templates/application.started.xml});
INSERT INTO resources(id, name, restype, content) VALUES('02', 'Cash.Close', 0, $FILE{/com/openbravo/pos/templates/Cash.Close.xml});
INSERT INTO resources(ID, name, restype, content) VALUES('03', 'Customer.Created', 0, $FILE{/com/openbravo/pos/templates/customer.created.xml});
INSERT INTO resources(ID, name, restype, content) VALUES('04', 'Customer.Deleted', 0, $FILE{/com/openbravo/pos/templates/customer.deleted.xml});
INSERT INTO resources(ID, name, restype, content) VALUES('05', 'Customer.Updated', 0, $FILE{/com/openbravo/pos/templates/customer.updated.xml});
INSERT INTO resources(id, name, restype, content) VALUES('06', 'payment.cash', 0, $FILE{/com/openbravo/pos/templates/payment.cash.txt});
INSERT INTO resources(id, name, restype, content) VALUES('07', 'Ticket.Buttons', 0, $FILE{/com/openbravo/pos/templates/Ticket.Buttons.xml});
INSERT INTO resources(id, name, restype, content) VALUES('08', 'Ticket.Close', 0, $FILE{/com/openbravo/pos/templates/Ticket.Close.xml});
INSERT INTO resources(id, name, restype, content) VALUES('09', 'Ticket.Line', 0, $FILE{/com/openbravo/pos/templates/Ticket.Line.xml});
INSERT INTO resources(id, name, restype, content) VALUES('10', 'Window.Title', 0, $FILE{/com/openbravo/pos/templates/Window.Title.txt});

-- IMAGES
INSERT INTO resources(id, name, restype, content) VALUES('11', 'img.001', 1, $FILE{/com/openbravo/images/.01.png});
INSERT INTO resources(id, name, restype, content) VALUES('12', 'img.002', 1, $FILE{/com/openbravo/images/.02.png});
INSERT INTO resources(id, name, restype, content) VALUES('13', 'img.005', 1, $FILE{/com/openbravo/images/.05.png});
INSERT INTO resources(id, name, restype, content) VALUES('14', 'img.010', 1, $FILE{/com/openbravo/images/.10.png});
INSERT INTO resources(id, name, restype, content) VALUES('15', 'img.020', 1, $FILE{/com/openbravo/images/.20.png});
INSERT INTO resources(id, name, restype, content) VALUES('16', 'img.050', 1, $FILE{/com/openbravo/images/.50.png});
INSERT INTO resources(id, name, restype, content) VALUES('17', 'img.1', 1, $FILE{/com/openbravo/images/1.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('18', 'img.2', 1, $FILE{/com/openbravo/images/2.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('19', 'img.5', 1, $FILE{/com/openbravo/images/5.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('20', 'img.10', 1, $FILE{/com/openbravo/images/10.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('21', 'img.20', 1, $FILE{/com/openbravo/images/20.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('22', 'img.50', 1, $FILE{/com/openbravo/images/50.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('23', 'img.100', 1, $FILE{/com/openbravo/images/100.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('24', 'img.200', 1, $FILE{/com/openbravo/images/200.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('25', 'img.500', 1, $FILE{/com/openbravo/images/500.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('26', 'img.1000', 1, $FILE{/com/openbravo/images/1000.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('27', 'img.cash', 1, $FILE{/com/openbravo/images/cash.png});
INSERT INTO resources(id, name, restype, content) VALUES('28', 'img.cashdrawer', 1, $FILE{/com/openbravo/images/cashdrawer.png});
INSERT INTO resources(id, name, restype, content) VALUES('29', 'img.discount', 1, $FILE{/com/openbravo/images/discount.png});
INSERT INTO resources(id, name, restype, content) VALUES('30', 'img.discount_b', 1, $FILE{/com/openbravo/images/discount_b.png});
INSERT INTO resources(id, name, restype, content) VALUES('31', 'img.heart', 1, $FILE{/com/openbravo/images/heart.png});
INSERT INTO resources(id, name, restype, content) VALUES('32', 'img.keyboard_48', 1, $FILE{/com/openbravo/images/keyboard_48.png});
INSERT INTO resources(id, name, restype, content) VALUES('33', 'img.kit_print', 1, $FILE{/com/openbravo/images/kit_print.png});
INSERT INTO resources(id, name, restype, content) VALUES('34', 'img.no_photo', 1, $FILE{/com/openbravo/images/no_photo.png});
INSERT INTO resources(id, name, restype, content) VALUES('35', 'img.refundit', 1, $FILE{/com/openbravo/images/refundit.png});
INSERT INTO resources(id, name, restype, content) VALUES('36', 'img.run_script', 1, $FILE{/com/openbravo/images/run_script.png});
INSERT INTO resources(id, name, restype, content) VALUES('37', 'img.ticket_print', 1, $FILE{/com/openbravo/images/ticket_print.png});
INSERT INTO resources(id, name, restype, content) VALUES('38', 'img.posapps', 1, $FILE{/com/openbravo/images/img.posapps.png});
INSERT INTO resources(id, name, restype, content) VALUES('39', 'Printer.Ticket.Logo', 1, $FILE{/com/openbravo/images/printer.ticket.logo.jpg});

-- PRINTER
INSERT INTO resources(id, name, restype, content) VALUES('40', 'Printer.CloseCash.Preview', 0, $FILE{/com/openbravo/pos/templates/Printer.CloseCash.Preview.xml});
INSERT INTO resources(id, name, restype, content) VALUES('41', 'Printer.CloseCash', 0, $FILE{/com/openbravo/pos/templates/Printer.CloseCash.xml});
INSERT INTO resources(id, name, restype, content) VALUES('42', 'Printer.CustomerPaid', 0, $FILE{/com/openbravo/pos/templates/Printer.CustomerPaid.xml});
INSERT INTO resources(id, name, restype, content) VALUES('43', 'Printer.CustomerPaid2', 0, $FILE{/com/openbravo/pos/templates/Printer.CustomerPaid2.xml});
INSERT INTO resources(id, name, restype, content) VALUES('44', 'Printer.FiscalTicket', 0, $FILE{/com/openbravo/pos/templates/Printer.FiscalTicket.xml});
INSERT INTO resources(id, name, restype, content) VALUES('45', 'Printer.Inventory', 0, $FILE{/com/openbravo/pos/templates/Printer.Inventory.xml});
INSERT INTO resources(id, name, restype, content) VALUES('46', 'Printer.OpenDrawer', 0, $FILE{/com/openbravo/pos/templates/Printer.OpenDrawer.xml});
INSERT INTO resources(id, name, restype, content) VALUES('47', 'Printer.PartialCash', 0, $FILE{/com/openbravo/pos/templates/Printer.PartialCash.xml});
INSERT INTO resources(id, name, restype, content) VALUES('48', 'Printer.PrintLastTicket', 0, $FILE{/com/openbravo/pos/templates/Printer.PrintLastTicket.xml});
INSERT INTO resources(id, name, restype, content) VALUES('49', 'Printer.Product', 0, $FILE{/com/openbravo/pos/templates/Printer.Product.xml});
INSERT INTO resources(id, name, restype, content) VALUES('50', 'Printer.ReprintTicket', 0, $FILE{/com/openbravo/pos/templates/Printer.ReprintTicket.xml});
INSERT INTO resources(id, name, restype, content) VALUES('51', 'Printer.Start', 0, $FILE{/com/openbravo/pos/templates/Printer.Start.xml});
INSERT INTO resources(id, name, restype, content) VALUES('52', 'Printer.Ticket.P1', 0, $FILE{/com/openbravo/pos/templates/Printer.Ticket.P1.xml});
INSERT INTO resources(id, name, restype, content) VALUES('53', 'Printer.Ticket.P2', 0, $FILE{/com/openbravo/pos/templates/Printer.Ticket.P2.xml});
INSERT INTO resources(id, name, restype, content) VALUES('54', 'Printer.Ticket.P3', 0, $FILE{/com/openbravo/pos/templates/Printer.Ticket.P3.xml});
INSERT INTO resources(id, name, restype, content) VALUES('55', 'Printer.Ticket.P4', 0, $FILE{/com/openbravo/pos/templates/Printer.Ticket.P4.xml});
INSERT INTO resources(id, name, restype, content) VALUES('56', 'Printer.Ticket.P5', 0, $FILE{/com/openbravo/pos/templates/Printer.Ticket.P5.xml});
INSERT INTO resources(id, name, restype, content) VALUES('57', 'Printer.Ticket.P6', 0, $FILE{/com/openbravo/pos/templates/Printer.Ticket.P6.xml});
INSERT INTO resources(id, name, restype, content) VALUES('58', 'Printer.Ticket', 0, $FILE{/com/openbravo/pos/templates/Printer.Ticket.xml});
INSERT INTO resources(id, name, restype, content) VALUES('59', 'Printer.Ticket2', 0, $FILE{/com/openbravo/pos/templates/Printer.Ticket2.xml});
INSERT INTO resources(id, name, restype, content) VALUES('60', 'Printer.TicketClose', 0, $FILE{/com/openbravo/pos/templates/Printer.TicketClose.xml});
INSERT INTO resources(id, name, restype, content) VALUES('61', 'Printer.TicketLine', 0, $FILE{/com/openbravo/pos/templates/Printer.TicketLine.xml});
INSERT INTO resources(id, name, restype, content) VALUES('62', 'Printer.TicketNew', 0, $FILE{/com/openbravo/pos/templates/Printer.TicketLine.xml});
INSERT INTO resources(id, name, restype, content) VALUES('63', 'Printer.TicketPreview', 0, $FILE{/com/openbravo/pos/templates/Printer.TicketPreview.xml});
INSERT INTO resources(id, name, restype, content) VALUES('64', 'Printer.TicketPreview_A4', 0, $FILE{/com/openbravo/pos/templates/Printer.TicketPreview_A4.xml});
INSERT INTO resources(id, name, restype, content) VALUES('65', 'Printer.TicketRemote', 0, $FILE{/com/openbravo/pos/templates/Printer.TicketRemote.xml});
INSERT INTO resources(id, name, restype, content) VALUES('66', 'Printer.TicketTotal', 0, $FILE{/com/openbravo/pos/templates/Printer.TicketTotal.xml});

-- SCRIPTS
INSERT INTO resources(id, name, restype, content) VALUES('67', 'script.Keyboard', 0, $FILE{/com/openbravo/pos/templates/script.Keyboard.txt});
INSERT INTO resources(id, name, restype, content) VALUES('68', 'script.Linediscount', 0, $FILE{/com/openbravo/pos/templates/script.Linediscount.txt});
INSERT INTO resources(id, name, restype, content) VALUES('69', 'script.posapps', 0, $FILE{/com/openbravo/pos/templates/script.posapps.txt});
INSERT INTO resources(id, name, restype, content) VALUES('70', 'script.SendOrder', 0, $FILE{/com/openbravo/pos/templates/script.SendOrder.txt});
INSERT INTO resources(id, name, restype, content) VALUES('71', 'script.Totaldiscount', 0, $FILE{/com/openbravo/pos/templates/script.Totaldiscount.txt});
INSERT INTO resources(id, name, restype, content) VALUES('80', 'Link.Jamali', 0, $FILE{/com/openbravo/pos/templates/Link.Jamali.xml});


