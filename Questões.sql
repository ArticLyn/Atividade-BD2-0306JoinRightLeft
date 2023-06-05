USE bdLivraria

--EXERCICIO-1: O nome dos livros ao lado do nome das editoras e do nome dos autores 
SELECT tbLivro.nomeLivro, tbEditora.nomeEditora, tbAutor.nomeAutor FROM tbLivro
INNER JOIN tbEditora ON tbLivro.codEditora = tbEditora.codEditora
INNER JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor;

--EXERCICIO-2: O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for “Cia das Letras” 
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor FROM tbLivro
INNER JOIN tbEditora ON tbLivro.codEditora = tbEditora.codEditora
INNER JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
WHERE tbEditora.nomeEditora = 'Companhia das Letras';

--EXERCICIO-3: O nome dos livros ao lado dos nomes dos autores, somente dos livros que não forem do autor “Érico Veríssimo” 
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor FROM tbLivro
INNER JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
WHERE tbAutor.nomeAutor <> 'Érico Veríssimo';

--EXERCICIO-4: Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que não tem livros cadastrados 
SELECT tbAutor.nomeAutor, ISNULL(tbLivro.nomeLivro, 'Nenhum livro cadastrado') AS nomeLivro FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor;

--EXERCICIO-5: Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que não tem autores cadastrados 
SELECT ISNULL(tbAutor.nomeAutor, 'Nenhum autor cadastrado') AS nomeAutor, tbLivro.nomeLivro FROM tbLivro
LEFT JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor;

--EXERCICIO-6: O nome dos autores ao lado dos nomes dos livros, indiferente do autor ter ou não livro publicado, e indiferente do livro pertencer a algum autor.
SELECT ISNULL(tbAutor.nomeAutor, 'Nenhum autor cadastrado') AS nomeAutor, ISNULL(tbLivro.nomeLivro, 'Nenhum livro cadastrado') AS nomeLivro FROM tbAutor
FULL JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor;

--EXERCICIO-7: A editora Ática irá publicar todos os títulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora Ática. 
SELECT tbLivro.nomeLivro, 'Ática' AS nomeEditora FROM tbLivro;

--EXERCICIO-8: Somente os nomes dos autores que não tem livros cadastrados.
SELECT tbAutor.nomeAutor FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
WHERE tbLivro.codLivro IS NULL;

--EXERCICIO-9: Os nomes dos gêneros que não possuem nenhum livro cadastrado. 
SELECT tbGenero.nomeGenero FROM tbGenero
LEFT JOIN tbLivro ON tbGenero.codGenero = tbLivro.codLivro;