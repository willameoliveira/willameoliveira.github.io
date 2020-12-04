/**
 * Aparece e some o menu e valida formulário
 */

let botaoMenu = document.querySelector('button');
botaoMenu.onclick = function() {
	let ul = document.querySelector('ul');
	if (ul.style.display === 'none') {
		ul.style.display = 'flex';
	} else {
		ul.style.display = 'none';
	}
}