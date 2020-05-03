[33mtag v1.0[m
Tagger: GussAlves <gus.alves.araujo@gmail.com>
Date:   Sun May 3 10:25:27 2020 -0300

Campo-Minado-terminal

[33mcommit a173d7f5ce9ce6f7e1532f52a1850238a04a3ea1[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m, [m[1;33mtag: v1.0[m[33m, [m[1;31morigin/master[m[33m)[m
Author: GussAlves <gus.alves.araujo@gmail.com>
Date:   Sun May 3 10:24:41 2020 -0300

    AplicaÃ§Ã£o finalizada!!!!!! testes realizados

[1mdiff --git a/campo-minado-java/src/br/com/gussalves/cm/Aplicacao.java b/campo-minado-java/src/br/com/gussalves/cm/Aplicacao.java[m
[1mnew file mode 100644[m
[1mindex 0000000..26d1f99[m
[1m--- /dev/null[m
[1m+++ b/campo-minado-java/src/br/com/gussalves/cm/Aplicacao.java[m
[36m@@ -0,0 +1,14 @@[m
[32m+[m[32mpackage br.com.gussalves.cm;[m
[32m+[m
[32m+[m[32mimport br.com.gussalves.cm.modelo.Tabuleiro;[m
[32m+[m[32mimport br.com.gussalves.cm.visao.TabuleiroTerminal;[m
[32m+[m
[32m+[m[32mpublic class Aplicacao {[m
[32m+[m
[32m+[m	[32mpublic static void main(String[] args) {[m
[32m+[m[41m		[m
[32m+[m		[32m// Possível descidir o tamanho do tabuleiro (linha, coluna, bombas)[m
[32m+[m		[32mTabuleiro tabuleiro = new Tabuleiro(6, 6, 3);[m
[32m+[m		[32mnew TabuleiroTerminal(tabuleiro);[m
[32m+[m	[32m}[m
[32m+[m[32m}[m
[1mdiff --git a/campo-minado-java/src/br/com/gussalves/cm/modelo/Campo.java b/campo-minado-java/src/br/com/gussalves/cm/modelo/Campo.java[m
[1mindex bfc7131..e32d668 100644[m
[1m--- a/campo-minado-java/src/br/com/gussalves/cm/modelo/Campo.java[m
[1m+++ b/campo-minado-java/src/br/com/gussalves/cm/modelo/Campo.java[m
[36m@@ -79,7 +79,11 @@[m [mpublic class Campo {[m
 		return marcado;[m
 	}[m
 	[m
[31m-	public boolean isAberto() {[m
[32m+[m	[32mvoid setAberto(boolean aberto) {[m
[32m+[m		[32mthis.aberto = aberto;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mboolean isAberto() {[m
 		return aberto;[m
 	}[m
 	[m
[1mdiff --git a/campo-minado-java/src/br/com/gussalves/cm/modelo/Tabuleiro.java b/campo-minado-java/src/br/com/gussalves/cm/modelo/Tabuleiro.java[m
[1mindex 24bc9f4..3f6e3cd 100644[m
[1m--- a/campo-minado-java/src/br/com/gussalves/cm/modelo/Tabuleiro.java[m
[1m+++ b/campo-minado-java/src/br/com/gussalves/cm/modelo/Tabuleiro.java[m
[36m@@ -81,9 +81,18 @@[m [mpublic class Tabuleiro {[m
 	public String toString() {[m
 		StringBuilder sb = new StringBuilder();[m
 		[m
[32m+[m		[32msb.append("  ");[m
[32m+[m		[32mfor (int c = 0; c < colunas; c++) {[m
[32m+[m			[32msb.append(" ");[m
[32m+[m			[32msb.append(c);[m
[32m+[m			[32msb.append(" ");[m
[32m+[m		[32m}[m
[32m+[m		[32msb.append("\n");[m
[32m+[m[41m		[m
 		int i = 0;[m
 		for (int l = 0; l < linhas; l++) {[m
[31m-			[m
[32m+[m			[32msb.append(l);[m
[32m+[m			[32msb.append(" ");[m
 			for (int c = 0; c < colunas; c++) {[m
 				sb.append(" ");[m
 				sb.append(campos.get(i));[m
[1mdiff --git a/campo-minado-java/src/br/com/gussalves/cm/visao/TabuleiroTerminal.java b/campo-minado-java/src/br/com/gussalves/cm/visao/TabuleiroTerminal.java[m
[1mindex 452d3c3..7f553ba 100644[m
[1m--- a/campo-minado-java/src/br/com/gussalves/cm/visao/TabuleiroTerminal.java[m
[1m+++ b/campo-minado-java/src/br/com/gussalves/cm/visao/TabuleiroTerminal.java[m
[36m@@ -60,9 +60,10 @@[m [mpublic class TabuleiroTerminal {[m
 					tabuleiro.alterarMarcacao(xy.next(), xy.next());[m
 				}[m
 			}[m
[31m-			[m
[32m+[m			[32mSystem.out.println(tabuleiro);[m
 			System.out.println("Você ganhou!!!");[m
 		} catch (ExplosaoException e) {[m
[32m+[m			[32mSystem.out.println(tabuleiro);[m
 			System.out.println("Você Perdeu!");[m
 		}[m
 	}[m
