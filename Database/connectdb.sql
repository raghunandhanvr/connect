-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 08, 2021 at 09:20 AM
-- Server version: 8.0.26-0ubuntu0.20.04.2
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `connectdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `block_id` int NOT NULL,
  `block_by` int NOT NULL,
  `user` int NOT NULL,
  `block_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `bkmrk_id` int NOT NULL,
  `bkmrk_by` int NOT NULL,
  `post_id` int NOT NULL,
  `bkmrk_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`bkmrk_id`, `bkmrk_by`, `post_id`, `bkmrk_time`) VALUES
(4, 41, 106, '1627142228768'),
(5, 31, 108, '1627216544907');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int NOT NULL,
  `type` enum('text','image','sticker') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `commentSrc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `comment_by` int NOT NULL,
  `post_id` int NOT NULL,
  `comment_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `type`, `text`, `commentSrc`, `comment_by`, `post_id`, `comment_time`) VALUES
(108, 'text', 'Test Comment\n', '', 31, 105, '1627142081386'),
(109, 'text', 'alert(1)', '', 41, 105, '1627142254820');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `con_id` int NOT NULL,
  `user_one` int NOT NULL,
  `user_two` int NOT NULL,
  `con_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `fav_id` int NOT NULL,
  `fav_by` int NOT NULL,
  `user` int NOT NULL,
  `fav_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `follow_system`
--

CREATE TABLE `follow_system` (
  `follow_id` int NOT NULL,
  `follow_by` int NOT NULL,
  `follow_by_username` varchar(32) NOT NULL,
  `follow_to` int NOT NULL,
  `follow_to_username` varchar(32) NOT NULL,
  `follow_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow_system`
--

INSERT INTO `follow_system` (`follow_id`, `follow_by`, `follow_by_username`, `follow_to`, `follow_to_username`, `follow_time`) VALUES
(326, 31, 'testraghu', 41, 'testtushar', '1627142028715'),
(327, 41, 'testtushar', 31, 'testraghu', '1627142045536'),
(328, 41, 'testtushar', 32, 'raghuvr', '1627142269856'),
(329, 42, 'qwerty', 32, 'raghuvr', '1627314838256'),
(331, 42, 'qwerty', 34, 'testraghu2', '1627314841926'),
(332, 42, 'qwerty', 33, 'raghu', '1627314842375'),
(333, 42, 'qwerty', 31, 'testraghu', '1627314842899'),
(334, 42, 'qwerty', 41, 'testtushar', '1627314843395'),
(335, 42, 'qwerty', 29, 'steve_jobs', '1627314843851');

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `grp_member_id` int NOT NULL,
  `group_id` int NOT NULL,
  `member` int NOT NULL,
  `added_by` int NOT NULL,
  `joined_group` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_members`
--

INSERT INTO `group_members` (`grp_member_id`, `group_id`, `member`, `added_by`, `joined_group`) VALUES
(69, 30, 31, 31, '1627142154426'),
(71, 32, 41, 41, '1627142296852'),
(72, 33, 32, 32, '1630133649268'),
(73, 34, 31, 31, '1630394741136');

-- --------------------------------------------------------

--
-- Table structure for table `hashtags`
--

CREATE TABLE `hashtags` (
  `hashtag_id` int NOT NULL,
  `hashtag` varchar(1000) NOT NULL,
  `post_id` int NOT NULL,
  `user` int NOT NULL,
  `hashtag_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hashtags`
--

INSERT INTO `hashtags` (`hashtag_id`, `hashtag`, `post_id`, `user`, `hashtag_time`) VALUES
(66, '#testselfpost', 105, 31, '1627142069371'),
(67, '#testpost', 106, 31, '1627142203566'),
(68, '#testpost', 107, 31, '1627198366957'),
(69, '#testraghu', 108, 31, '1627216491996'),
(70, '#testpost', 109, 31, '1627383156820'),
(71, '#testupload', 110, 32, '1630133770422');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int NOT NULL,
  `post_id` int NOT NULL,
  `like_by` int NOT NULL,
  `like_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `post_id`, `like_by`, `like_time`) VALUES
(86, 105, 31, '1627142072929'),
(87, 106, 41, '1627142230307'),
(88, 105, 41, '1627142231862'),
(89, 106, 31, '1627198382661');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int NOT NULL,
  `con_id` int NOT NULL,
  `mssg_by` int NOT NULL,
  `mssg_to` int NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` enum('text','image','sticker') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` enum('read','unread') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'unread',
  `message_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `con_id`, `mssg_by`, `mssg_to`, `message`, `type`, `status`, `message_time`) VALUES
(110, 44, 32, 31, 'tets message\n', 'text', 'read', '1626276004097'),
(111, 44, 31, 32, 'testresendf\n', 'text', 'read', '1626276021673'),
(112, 44, 31, 32, 'connect_message_1626276038273.jpg', 'image', 'read', '1626276038273'),
(113, 44, 32, 31, 'helloii', 'text', 'read', '1626342855299'),
(114, 44, 31, 32, 'hi', 'text', 'read', '1626617832501'),
(115, 44, 32, 31, 'connect_message_1626618078190.jpg', 'image', 'read', '1626618078190'),
(116, 45, 24, 32, 'hai\n', 'text', 'read', '1626691763284'),
(117, 45, 24, 32, 'connect_message_1626691769114.jpg', 'image', 'read', '1626691769114'),
(118, 45, 24, 32, 'delete msg', 'text', 'read', '1626691797957'),
(122, 45, 24, 32, 'helo\n', 'text', 'read', '1626691813562'),
(123, 45, 32, 24, 'ok hai', 'text', 'read', '1626691827278'),
(124, 45, 24, 32, 'hai helo', 'text', 'read', '1626691868195'),
(125, 45, 32, 24, 'hi', 'text', 'read', '1626691906247'),
(126, 45, 24, 32, 'hiiii\n', 'text', 'read', '1626692094019'),
(127, 45, 32, 24, 'hello\n', 'text', 'read', '1626692110689'),
(128, 45, 24, 32, 'hiiii', 'text', 'read', '1626692126798'),
(129, 45, 24, 32, '😃', 'text', 'read', '1626692137938'),
(130, 45, 24, 32, '😻', 'text', 'read', '1626692144597'),
(131, 46, 31, 36, 'hai sar', 'text', 'read', '1626969086866'),
(132, 46, 36, 31, 'hi bor\n', 'text', 'read', '1626977323371');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notify_id` int NOT NULL,
  `notify_by` int NOT NULL,
  `notify_to` int NOT NULL,
  `post_id` int NOT NULL,
  `group_id` int NOT NULL,
  `type` enum('follow','tag','like','share','shared_your_post','comment','favourites','recommend','add_grp_member','invite','change_admin','new_con','mention_post','mention_comment') NOT NULL,
  `user` int NOT NULL,
  `notify_time` varchar(100) NOT NULL,
  `status` enum('read','unread') NOT NULL DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notify_id`, `notify_by`, `notify_to`, `post_id`, `group_id`, `type`, `user`, `notify_time`, `status`) VALUES
(676, 31, 41, 0, 0, 'follow', 0, '1627142028992', 'read'),
(677, 41, 31, 0, 0, 'follow', 0, '1627142046289', 'read'),
(678, 31, 41, 105, 0, 'tag', 0, '1627142069888', 'read'),
(679, 41, 31, 106, 0, 'like', 0, '1627142230781', 'read'),
(680, 41, 31, 105, 0, 'like', 0, '1627142232196', 'read'),
(681, 41, 31, 105, 0, 'share', 0, '1627142235276', 'read'),
(682, 41, 31, 105, 0, 'shared_your_post', 0, '1627142235285', 'read'),
(683, 41, 31, 105, 0, 'comment', 0, '1627142255485', 'read'),
(684, 41, 32, 0, 0, 'follow', 0, '1627142270450', 'read'),
(685, 42, 32, 0, 0, 'follow', 0, '1627314838648', 'read'),
(686, 42, 33, 0, 0, 'follow', 0, '1627314840973', 'unread'),
(687, 42, 34, 0, 0, 'follow', 0, '1627314842283', 'unread'),
(688, 42, 33, 0, 0, 'follow', 0, '1627314842736', 'unread'),
(689, 42, 31, 0, 0, 'follow', 0, '1627314843258', 'read'),
(690, 42, 41, 0, 0, 'follow', 0, '1627314843751', 'unread'),
(691, 42, 29, 0, 0, 'follow', 0, '1627314844207', 'unread');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int NOT NULL,
  `user` int NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `imgSrc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `filter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'normal',
  `location` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` enum('user','group') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'user',
  `group_id` int NOT NULL,
  `post_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user`, `description`, `imgSrc`, `filter`, `location`, `type`, `group_id`, `post_time`) VALUES
(110, 32, '#testupload', 'connect_1630133770147.jpg', 'filter-normal', '', 'user', 0, '1630133770147');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `post_tag_id` int NOT NULL,
  `post_id` int NOT NULL,
  `user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`post_tag_id`, `post_id`, `user`) VALUES
(4, 105, 41);

-- --------------------------------------------------------

--
-- Table structure for table `profile_views`
--

CREATE TABLE `profile_views` (
  `view_id` int NOT NULL,
  `view_by` int NOT NULL,
  `view_to` int NOT NULL,
  `view_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile_views`
--

INSERT INTO `profile_views` (`view_id`, `view_by`, `view_to`, `view_time`) VALUES
(499, 31, 41, '1627142026333'),
(500, 42, 32, '1627314834332'),
(501, 42, 29, '1627314845652'),
(502, 31, 11, '1628341408556'),
(503, 32, 44, '1629898500280'),
(504, 32, 43, '1629898538967'),
(505, 32, 41, '1630133664426'),
(506, 32, 29, '1630133712770'),
(507, 31, 33, '1630394674091'),
(508, 31, 29, '1630394839738');

-- --------------------------------------------------------

--
-- Table structure for table `recommendations`
--

CREATE TABLE `recommendations` (
  `recommend_id` int NOT NULL,
  `recommend_by` int NOT NULL,
  `recommend_to` int NOT NULL,
  `recommend_of` int NOT NULL,
  `recommend_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shares`
--

CREATE TABLE `shares` (
  `share_id` int NOT NULL,
  `share_by` int NOT NULL,
  `share_to` int NOT NULL,
  `post_id` int NOT NULL,
  `share_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shares`
--

INSERT INTO `shares` (`share_id`, `share_by`, `share_to`, `post_id`, `share_time`) VALUES
(116, 41, 31, 105, '1627142234724');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int NOT NULL,
  `user` int NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `group_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `bio` varchar(2000) NOT NULL,
  `admin` int NOT NULL,
  `group_type` enum('public','private') NOT NULL DEFAULT 'public',
  `created` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usergroups`
--

INSERT INTO `usergroups` (`group_id`, `name`, `bio`, `admin`, `group_type`, `created`) VALUES
(33, 'Test Group', 'Test Group', 32, 'public', '1630133649256'),
(34, 'g', '', 31, 'public', '1630394741127');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `firstname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `surname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `bio` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `joined` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email_verified` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'no',
  `account_type` enum('public','private') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'public',
  `instagram` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `twitter` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `facebook` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `github` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `website` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `isOnline` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'no',
  `lastOnline` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstname`, `surname`, `email`, `password`, `bio`, `joined`, `email_verified`, `account_type`, `instagram`, `twitter`, `facebook`, `github`, `website`, `phone`, `isOnline`, `lastOnline`) VALUES
(11, 'nobita', 'nobita', 'nobi', 'nobita@gmail.com', '$2a$10$nzMI2G054StCufuo4fzkEOWhpwUWKqZwV67jbPqaqqSNDNnF5led2', '', '1516522466189', 'no', 'public', '', '', '', '', '', '', 'no', '1524499561897'),
(29, 'steve_jobs', 'steve', 'jobs', 'steve_jobs@gmail.com', '$2a$10$B05HNF3/pnK.8fU7kCJHpuaU5LpVxwao9Wmkn3Md2sAPc5GINiU6O', '', '1518018498672', 'no', 'public', '', '', '', '', '', '', 'no', ''),
(31, 'testraghu', 'test', 'raghu', 'testraghu@gmail.com', '$2a$10$lMI0K20e5mYIBj5gIHQwuOgI1Wa4IU8uQXQK.gXm7SfI91W6jXGMm', 'Test Account for Testing purposes by Raghu', '1625754223407', 'no', 'public', 'raghuvr', 'raghuvr_', 'raghunandhanvr', 'raghunandhanvr', '', '8667322394', 'yes', '1629908441152'),
(32, 'raghuvr', 'raghu', 'admin', 'r4ghunandhan@gmail.com', '$2a$10$OlQ.jjWFsKbSBlv9THxPH.iV6H7HiOCExVZOqTQttJmSiOrbtU3Iu', 'Developer of Connect', '1625754381723', 'no', 'private', '', '', '', '', '', '', 'no', '1630752897918'),
(33, 'raghu', 'raghu', 'accnt', 'raghu@raghu.com', '$2a$10$pYXP5LadCFO8jVVr9K63K.pxNqYYQbUL02Bhehi2Whffx2BGBeAh6', '', '1626088525249', 'no', 'public', '', '', '', '', '', '', 'yes', ''),
(34, 'testraghu2', 'testraghu', 'teragh2', 'testraghu2@gmail.com', '$2a$10$j4GJQyCZv.rNamFIz4fmae5c.qbU3oNawADxE8JqL2QGJKt16RJmq', '', '1626967466159', 'no', 'public', '', '', '', '', '', '', 'no', '1626967558872');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`block_id`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`bkmrk_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`con_id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`fav_id`);

--
-- Indexes for table `follow_system`
--
ALTER TABLE `follow_system`
  ADD PRIMARY KEY (`follow_id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`grp_member_id`);

--
-- Indexes for table `hashtags`
--
ALTER TABLE `hashtags`
  ADD PRIMARY KEY (`hashtag_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notify_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`post_tag_id`);

--
-- Indexes for table `profile_views`
--
ALTER TABLE `profile_views`
  ADD PRIMARY KEY (`view_id`);

--
-- Indexes for table `recommendations`
--
ALTER TABLE `recommendations`
  ADD PRIMARY KEY (`recommend_id`);

--
-- Indexes for table `shares`
--
ALTER TABLE `shares`
  ADD PRIMARY KEY (`share_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `block_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `bkmrk_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `con_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `fav_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `follow_system`
--
ALTER TABLE `follow_system`
  MODIFY `follow_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=336;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `grp_member_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `hashtags`
--
ALTER TABLE `hashtags`
  MODIFY `hashtag_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notify_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=692;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `post_tag_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `profile_views`
--
ALTER TABLE `profile_views`
  MODIFY `view_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=509;

--
-- AUTO_INCREMENT for table `recommendations`
--
ALTER TABLE `recommendations`
  MODIFY `recommend_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shares`
--
ALTER TABLE `shares`
  MODIFY `share_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `group_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
