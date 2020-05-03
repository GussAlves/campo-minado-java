package br.com.gussalves.cm.modelo;

import java.util.ArrayList;
import java.util.List;

import br.com.gussalves.cm.excecao.ExplosaoException;

public class Campo {

	private final int linha;
	private final int coluna;
	
	// por padrão o boolean já vem false
	private boolean minado; 
	private boolean aberto;
	private boolean marcado;
	
	private List<Campo> vizinhos = new ArrayList<>();
	
	Campo(int linha, int coluna) { // Construtor
		this.linha = linha;
		this.coluna = coluna;
	}
	
	// determina os 'vizinhos' do campo
	boolean adicionarVizinho(Campo vizinho) {
		boolean linhaDiferente = linha != vizinho.linha;
		boolean colunaDiferente = coluna != vizinho.coluna;
		boolean diagonal = linhaDiferente && colunaDiferente;
		
		int deltaLinha = Math.abs(linha - vizinho.linha);
		int deltaColuna = Math.abs(coluna - vizinho.coluna);
		int deltaGeral = deltaColuna + deltaLinha;
		
		if(deltaGeral == 1 && !diagonal) {
			vizinhos.add(vizinho);
			return true;
		} else if(deltaGeral == 2 && diagonal) {
			vizinhos.add(vizinho);
			return true;
		} else {
			return false;
		}
	}
	
	// Passa o campo de altera o valor do campo true/false
	void alternarMarcacao() {
		if(!aberto) {
			marcado = !marcado;
		}
	}
	
	boolean abrir() { // Reaiza a abertura do campo 
		if(!aberto && !marcado) {
			aberto = true;
			
			if(minado) {
				throw new ExplosaoException();
			}
			
			if(vizinhancaSegura()) {
				vizinhos.forEach(v -> v.abrir());
			}		
			return true;
		} else {
			return false;			
		}
	}
	
	boolean vizinhancaSegura() { // Verifica se a vizinhança do campo é segura 
		return vizinhos.stream().noneMatch(v -> v.minado);
	}
	
	void minar() { // Metodo para minar um campo
			minado = true;			
	}
	
	public boolean isMarcado() {
		return marcado;
	}
	
	public boolean isAberto() {
		return aberto;
	}
	
	public boolean isfechado() {
		return !isAberto();
	}

	public boolean isMinado() {
		return minado;
	}
	
	public int getLinha() {
		return linha;
	}

	public int getColuna() {
		return coluna;
	}
	
	boolean objetivoalcancado() { // 
		boolean desvendado = !minado && aberto;
		boolean protegido = minado && marcado;
		return desvendado || protegido;
	}
	
	long minasNaVizinhanca() { // Verifica a quantiade de minas que tem na vizinhanca
		return vizinhos.stream().filter(v -> v.minado).count();
	}
	
	void reiniciar() { // Reinicia o game
		aberto = false;
		minado = false;
		marcado = false;
	}
	
	public String toString() {
		if(marcado) {
			return "x";
		} else if(aberto && minado) {
			return "*";
		} else if(aberto && minasNaVizinhanca() > 0) {
			return Long.toString(minasNaVizinhanca());
		} else if(aberto) {
			return " ";
		} else {
			return "?";
		}
	}
}
