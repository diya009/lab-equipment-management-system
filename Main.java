package com.lab;

import com.lab.db.DBConfig;
import com.lab.db.DatabaseInitializer;
import com.lab.ui.DBSettingsDialog;
import com.lab.ui.LoginFrame;
import com.lab.ui.Theme;

import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;

/**
 * Entry point of the College Lab Equipment Management System.
 *
 * Flow: load DB settings -> initialise database (tables + default data)
 *       -> show login screen.
 */
public class Main {

    public static void main(String[] args) {
        Theme.install();
        SwingUtilities.invokeLater(Main::start);
    }

    private static void start() {
        DBConfig config = DBConfig.load();
        while (true) {
            try {
                DatabaseInitializer.initialize();
                new LoginFrame().setVisible(true);
                return;
            } catch (Exception ex) {
                int choice = JOptionPane.showConfirmDialog(null,
                        "Could not connect to MySQL database.\n\n" + ex.getMessage()
                                + "\n\nMake sure MySQL Server is running, then check the connection settings."
                                + "\nDo you want to edit the database settings now?",
                        "Database Connection Error", JOptionPane.YES_NO_OPTION, JOptionPane.ERROR_MESSAGE);
                if (choice != JOptionPane.YES_OPTION) {
                    System.exit(1);
                }
                if (!DBSettingsDialog.show(null, config)) {
                    System.exit(1);
                }
            }
        }
    }
}
