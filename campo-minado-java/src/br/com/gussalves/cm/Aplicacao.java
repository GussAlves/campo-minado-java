package br.com.gussalves.cm;

import br.com.gussalves.cm.modelo.Tabuleiro;
import br.com.gussalves.cm.visao.TabuleiroTerminal;

public class Aplicacao {

	public static void main(String[] args) {
		
		// Possivel descidir o tamanho do tabuleiro (linha, coluna, bombas)
		Tabuleiro tabuleiro = new Tabuleiro(10, 10, 10);
		new TabuleiroTerminal(tabuleiro);
	}
}
