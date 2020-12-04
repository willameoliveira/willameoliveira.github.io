/**
 * Alterando imagem do site com um clique e adiciona o nome de usuário na página.
 */
let minhaImagem = document.querySelector('img');
minhaImagem.onclick = function() {
	let src = minhaImagem.getAttribute('src');
	if (src === 'imagens/icone-tarefasweb.png') {
		minhaImagem.setAttribute('src', 'imagens/icone-tarefasweb2.png');
	} else {
		minhaImagem.setAttribute('src', 'imagens/icone-tarefasweb.png');
	}
}

let meuCabecalho = document.querySelector('h1');
let meuBotao = document.querySelector('button');

function defineNomeUsuario() {
	let nomeUsuario = prompt('Por favor, digite seu nome: ');
	if (nomeUsuario !== null) {
		if (!nomeUsuario) {//se nomeUsuario está vazio
			defineNomeUsuario();
		}
		else {
			localStorage.setItem('nome', nomeUsuario);
			meuCabecalho.textContent = 'Bem vindo, ' + nomeUsuario;		
		}
	}
}

let nomeUsuario = localStorage.getItem('nome');
if (!nomeUsuario) {
	defineNomeUsuario();
} else {
	meuCabecalho.textContent = 'Bem vindo, ' + nomeUsuario;
}

meuBotao.onclick = function() {defineNomeUsuario();}
