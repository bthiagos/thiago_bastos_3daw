-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Dez-2020 às 06:11
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `thiago_bastos_1620470400080`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_ip` varchar(20) NOT NULL,
  `user_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `category_list`
--

INSERT INTO `category_list` (`id`, `name`) VALUES
(1, 'Bebidas'),
(3, 'Refeições'),
(4, 'Sobremesas'),
(5, 'Petiscos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `mobile` text NOT NULL,
  `email` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `orders`
--

INSERT INTO `orders` (`id`, `name`, `address`, `mobile`, `email`, `status`) VALUES
(3, 'Marciano marciano@faeterj-rio.edu.br', 'Av dos Professores 25, Centro, Rio de Janeiro - RJ', '2190000000', 'marciano@faeterj-rio.edu.br', 1),
(4, 'Marciano marciano@faeterj-rio.edu.br', 'Av dos Professores 25, Centro, Rio de Janeiro - RJ', '2190000000', 'marciano@faeterj-rio.edu.br', 1),
(5, 'Marciano marciano@faeterj-rio.edu.br', 'Av dos Professores 25, Centro, Rio de Janeiro - RJ', '2190000000', 'marciano@faeterj-rio.edu.br', 1),
(6, 'Marciano marciano@faeterj-rio.edu.br', 'Av dos Professores 25, Centro, Rio de Janeiro - RJ', '2190000000', 'marciano@faeterj-rio.edu.br', 0),
(7, 'Ricardo Marciano dos Santos', 'Av dos Professores 25, Centro, Rio de Janeiro - RJ', '2190000000', 'marciano@faeterj-rio.edu.br', 0),
(8, 'Ricardo Marciano dos Santos', 'Av dos Professores 25, Centro, Rio de Janeiro - RJ', '2190000000', 'marciano@faeterj-rio.edu.br', 0),
(9, 'Ricardo Marciano dos Santos', 'Av dos Professores 25, Centro, Rio de Janeiro - RJ', '2190000000', 'marciano@faeterj-rio.edu.br', 0),
(10, 'Ricardo Marciano dos Santos', 'Av dos Professores 25, Centro, Rio de Janeiro - RJ', '2190000000', 'marciano@faeterj-rio.edu.br', 0),
(11, 'Thiago Bastos', 'Rua das Marrecas 15', '2197002717', 'bthiagos@gmail.com', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `qty`) VALUES
(1, 1, 3, 1),
(2, 1, 5, 1),
(3, 1, 3, 1),
(4, 1, 6, 3),
(5, 2, 1, 2),
(6, 3, 5, 3),
(7, 4, 3, 2),
(8, 5, 1, 1),
(9, 6, 6, 2),
(10, 7, 5, 1),
(11, 7, 1, 1),
(12, 8, 8, 1),
(13, 9, 13, 1),
(14, 9, 7, 9),
(15, 10, 15, 1),
(16, 11, 12, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `img_path` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= unavailable, 2 Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `name`, `description`, `price`, `img_path`, `status`) VALUES
(7, 3, 'Isca de Peixe', 'Isca de peixe empanado com arroz, feijão e salada.', 24, '1607481600_prato-isca-peixe-empanado.png', 1),
(8, 1, 'Bacalhau à Pastor', 'Bacalhau do Porto acompanhado de arroz à grega, batatas, tomate e brócolis.', 65, '1607482200_prato-bacalhau-salada.png', 1),
(9, 3, 'Bife com Fritas', 'Bife de contrafilé com arroz, feijão, salada e fritas.', 35, '1607481720_prato-bife-com-fritas.png', 1),
(10, 3, 'Filé de Frango Grelhado', 'Filé de Frango com arroz, feijão, farofa e salada.', 22, '1607481780_prato-frango-grelhado.png', 1),
(11, 1, 'Coca-cola 350ml', 'Lata de Coca-cola 350ml ', 6, '1607481840_bebida-coca-lata.png', 1),
(12, 1, 'Fanta Laranja 350ml', 'Lata de Fanta Laranja 350ml', 5, '1607482200_bebida-fanta-laranja-lata.png', 1),
(13, 1, 'Sprite 350ml', 'Lata de Sprite 350ml', 5, '1607482200_bebida-sprite-lata.png', 1),
(14, 1, 'Del Valle Maracujá 350ml', 'Suco Del Valle Maracujá 350ml', 6, '1607481900_bebida-del-valle-maracuja.png', 1),
(15, 1, 'Mate Leão 300ml', 'Mate Leão 300ml', 6.5, '1607481900_bebida-matte.png', 1),
(16, 4, 'Torta de Limão', 'Torta de Limão', 7, '1607481960_sobremesa-torta-limao.png', 1),
(17, 4, 'Pudim', 'Pudim pequeno', 7, '1607481960_sobremesa-pudim.png', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'TocumFome', 'bthiagos@gmail.com', '(21)97002-7164', '1607482860_TOCUMFOME.png', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;Sobre&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 20px; color: rgb(116, 116, 116); font-family: Roboto; font-size: 16px;&quot;&gt;Para oferecer um&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;servi&ccedil;o de delivery&lt;/span&gt;&amp;nbsp;&eacute; preciso otimizar a sua produ&ccedil;&atilde;o para preparar e entregar refei&ccedil;&otilde;es em outros locais que n&atilde;o s&atilde;o seu estabelecimento, como a casa ou local de trabalho de seus clientes. A compra da refei&ccedil;&atilde;o pode ser realizada por diversas plataformas. V&aacute;rios app de delivery est&atilde;o dispon&iacute;veis para cadastro (iFood, UberEats, Rappi, etc), mas existem outras op&ccedil;&otilde;es como uma plataforma de delivery pr&oacute;prio do estabelecimento, e-commerce, whatsapp business e inclusive vendas por telefone.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 20px; color: rgb(116, 116, 116); font-family: Roboto; font-size: 16px;&quot;&gt;Nos primeiros meses de 2020, as mudan&ccedil;as vieram mais r&aacute;pido do que qualquer um poderia prever. Durante o enfrentamento da pandemia de COVID-19, o isolamento da popula&ccedil;&atilde;o fez com que os consumidores aumentasse a demanda de delivery, principalmente no segmento de alimenta&ccedil;&atilde;o. Todos precisaram se adaptar a esta nova rotina que inclui o trabalho em home office, trazendo novos desafios para as marcas em todo o mundo.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 20px; color: rgb(116, 116, 116); font-family: Roboto; font-size: 16px;&quot;&gt;Ent&atilde;o surgiu o &lt;b style=&quot;margin-bottom: 20px; color: rgb(116, 116, 116); font-family: Roboto; font-size: 16px;&quot;&gt;TocumFome&lt;/b&gt;, seu aplicativo funcional e org&acirc;nico.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', 'admin123', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address`) VALUES
(2, 'Ricardo', 'Marciano dos Santos', 'marciano@faeterj-rio.edu.br', 'e10adc3949ba59abbe56e057f20f883e', '2190000000', 'Av dos Professores 25, Centro, Rio de Janeiro - RJ'),
(3, 'Thiago', 'Bastos', 'bthiagos@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2197002717', 'Rua das Marrecas 15');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
