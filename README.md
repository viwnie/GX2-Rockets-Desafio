# Desafio GX2 Rockets 🚀
<p align="center">
  <img src="https://i.ibb.co/C1trZ4F/desafio-liferay.png" alt="Desafio Liferay">
</p>

<p align="center">
  <img src="https://www.gx2.com.br/wp-content/uploads/2021/05/logo-gx2-branco.png" alt="Imagem Logo GX2">
</p>

## Objetivos do desafio

Desenvolver um processo de aprovação de reembolso dentro da plataforma Liferay que permite a um funcionário submeter uma solicitação de reembolso, incluindo um comprovante e informações específicas. O processo deve incluir etapas de validação e aprovação por parte de um gerente e um diretor, antes do envio para a área financeira para o processamento final e pagamento do reembolso.

No tema alterar as cores e fontes para refletir a identidade visual da empresa.
Personalizar o layout da página do blog para exibir a lista de posts de forma mais atrativa.
Implementar uma funcionalidade de navegação por categoria de post.
Garantir que o tema seja responsivo e se adapte bem em dispositivos móveis.

Criar um portlet Liferay que permita aos usuários gerenciar suas tarefas ele deve:
exibir uma lista de tarefas com campos como título, descrição e data de vencimento.
Permitir a adição de novas tarefas.
Permitir a edição e exclusão de tarefas existentes.
Implementar uma funcionalidade para marcar tarefas como concluídas.
Garantir que a lista de tarefas seja atualizada dinamicamente sem recarregar a página.

## Estrutura do Repositório 📂

- **Desafio Estrutura:**
  - **conteudo**
    - **formularios**
      - `Forms-202405242151.portlet.lar` - Arquivo para importar formulários para dentro do Liferay.
      - `Formulário Reembolso.xml` - Arquivo em XML para copiar o formulário.
  - **design**
    - **fragmento**
      - `home` - Este fragmento é o banner da página.
    - **modelo-de-widget**
      - `Modelo-blog.ftl` - Modelo que exibe os blogs de acordo com o tema.
      - `Modelo-categorias.ftl` - Modelo que exibe as categorias de acordo com o tema.
    - **modelo-pagina-exibição**
      - `modelo-noticia` - Modelo de página que exibe as notícias de acordo com o tema.
        - `display-page-template.json`
        - `page-definition.json`
  - **dist**
    - `gx2-desafio-rocket-theme.war` - Importando este arquivo no Liferay, o tema será aplicado automaticamente.
  - **src**
    - **WEB-INF**
    - **css** - Todos os arquivos utilizados para estilizar as páginas.
    - **images** - Imagens utilizadas na criação do site.
    - **templates** - Estrutura do Liferay como Header, Footer, Body, Login, etc.
  - **workflow**
    - `fluxoReembolso.ftl` - Importando este arquivo será criado um fluxo de reembolso no seu site.

## Obrigado pelo seu tempo 🌟

Espero que este repositório atenda às expectativas e demonstre meu comprometimento e dedicação ao desafio proposto por vocês 💚.

Aguardo ansiosamente o feedback! 🚀📚👨‍🎓
