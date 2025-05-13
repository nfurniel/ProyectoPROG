import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class LaberintoConMuros extends JFrame implements ActionListener {
    private final int filas = 5;
    private final int columnas = 5;
    private Celda[][] laberinto = new Celda[filas][columnas];
    private JPanel gridPanel;
    private int jugadorX = 0;
    private int jugadorY = 0;

    private JButton arriba, abajo, izq, der;

    public LaberintoConMuros() {
        setTitle("Laberinto con muros");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(500, 500);
        setLayout(new BorderLayout());

        gridPanel = new JPanel(new GridLayout(filas, columnas));
        inicializarLaberinto();
        add(gridPanel, BorderLayout.CENTER);

        JPanel controles = new JPanel();
        arriba = new JButton("↑");
        abajo = new JButton("↓");
        izq = new JButton("←");
        der = new JButton("→");

        arriba.addActionListener(this);
        abajo.addActionListener(this);
        izq.addActionListener(this);
        der.addActionListener(this);

        controles.add(arriba);
        controles.add(abajo);
        controles.add(izq);
        controles.add(der);
        add(controles, BorderLayout.SOUTH);

        actualizarLaberinto();
        setVisible(true);
    }

    private void inicializarLaberinto() {
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                laberinto[i][j] = new Celda();
            }
        }

        // Ejemplo de muros:
        laberinto[0][0].muroAbajo = true;
        laberinto[0][0].muroDerecha = true;
        laberinto[0][1].muroDerecha = true;
        laberinto[1][1].muroIzquierda = true;
        laberinto[2][2].muroAbajo = true;
        laberinto[3][2].muroArriba = true;

        gridPanel.removeAll();
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                gridPanel.add(laberinto[i][j].boton);
            }
        }
    }

    private void actualizarLaberinto() {
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                JButton b = laberinto[i][j].boton;
                if (i == jugadorX && j == jugadorY) {
                    b.setBackground(Color.BLUE);
                } else {
                    b.setBackground(Color.WHITE);
                }

                b.setBorder(BorderFactory.createMatteBorder(
                    laberinto[i][j].muroArriba ? 4 : 1,
                    laberinto[i][j].muroIzquierda ? 4 : 1,
                    laberinto[i][j].muroAbajo ? 4 : 1,
                    laberinto[i][j].muroDerecha ? 4 : 1,
                    Color.BLACK
                ));
            }
        }
        gridPanel.revalidate();
        gridPanel.repaint();
    }

    private boolean puedeMover(int dx, int dy) {
        int nuevaX = jugadorX + dx;
        int nuevaY = jugadorY + dy;
        if (nuevaX < 0 || nuevaX >= filas || nuevaY < 0 || nuevaY >= columnas) return false;

        if (dx == -1 && laberinto[jugadorX][jugadorY].muroArriba) return false;
        if (dx == 1 && laberinto[jugadorX][jugadorY].muroAbajo) return false;
        if (dy == -1 && laberinto[jugadorX][jugadorY].muroIzquierda) return false;
        if (dy == 1 && laberinto[jugadorX][jugadorY].muroDerecha) return false;

        return true;
    }

    public void actionPerformed(ActionEvent e) {
        Object src = e.getSource();
        int dx = 0, dy = 0;

        if (src == arriba) dx = -1;
        else if (src == abajo) dx = 1;
        else if (src == izq) dy = -1;
        else if (src == der) dy = 1;

        if (puedeMover(dx, dy)) {
            jugadorX += dx;
            jugadorY += dy;
        } else {
            JOptionPane.showMessageDialog(this, "¡Movimiento bloqueado por un muro!");
        }

        actualizarLaberinto();
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                new LaberintoConMuros();
            }
        });
    }

    class Celda {
        JButton boton;
        boolean muroArriba = false;
        boolean muroAbajo = false;
        boolean muroIzquierda = false;
        boolean muroDerecha = false;

        Celda() {
            boton = new JButton();
            boton.setEnabled(false);
        }
    }
}
