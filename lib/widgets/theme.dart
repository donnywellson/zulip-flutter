import 'package:flutter/material.dart';

import '../api/model/model.dart';
import '../themes/appbar_theme.dart';
import '../themes/elevated_button_theme.dart';
import 'content.dart';
import 'emoji_reaction.dart';
import 'message_list.dart';
import 'channel_colors.dart';
import 'text.dart';

class ZulipTheme {
  ZulipTheme._();

  static ThemeData lightTheme(BuildContext context) {
    final DesignVariables designVariables = DesignVariables.light();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: designVariables.mainBackground,
      typography: zulipTypography(context),
      extensions: [
        ContentTheme.light(context),
        designVariables,
        EmojiReactionTheme.light(), // Adding EmojiReactionTheme
        MessageListTheme.light(),   // Adding MessageListTheme
      ],
      appBarTheme: ZAppBarTheme.lightAppBarTheme(context, designVariables),
      tooltipTheme: const TooltipThemeData(preferBelow: false),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    final DesignVariables designVariables = DesignVariables.dark();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: designVariables.mainBackground,
      typography: zulipTypography(context),
      extensions: [
        ContentTheme.dark(context),
        designVariables,
        EmojiReactionTheme.dark(), // Adding EmojiReactionTheme
        MessageListTheme.dark(),   // Adding MessageListTheme
      ],
      appBarTheme: ZAppBarTheme.darkAppBarTheme(context, designVariables),
      tooltipTheme: const TooltipThemeData(preferBelow: false),
      elevatedButtonTheme: ZButtonTheme.darkElevatedButtonTheme(designVariables),

    );
  }
}
/// The Zulip "brand color", a purplish blue.
///
/// This is chosen as the sRGB midpoint of the Zulip logo's gradient.
// As computed by Anders: https://github.com/zulip/zulip-mobile/pull/4467
const kZulipBrandColor = Color.fromRGBO(0x64, 0x92, 0xfe, 1);

/// Design variables, mainly from the Figma design.
///
/// For how to export these from the Figma, see:
///   https://github.com/zulip/zulip-flutter/pull/762#discussion_r1664748114
/// or
///   https://www.figma.com/design/1JTNtYo9memgW7vV6d0ygq/Zulip-Mobile?node-id=2945-49492&t=MEb4vtp7S26nntxm-0
class DesignVariables extends ThemeExtension<DesignVariables> {
  DesignVariables.light() :
    this._(
      background: const Color(0xffffffff),
      bgCounterUnread: const Color(0xff666699).withValues(alpha: 0.15),
      bgTopBar: const Color(0xfff5f5f5),
      borderBar: const Color(0x33000000),
      icon: const Color(0xff666699),
      labelCounterUnread: const Color(0xff222222),
      labelEdited: const HSLColor.fromAHSL(0.35, 0, 0, 0).toColor(),
      labelMenuButton: const Color(0xff222222),
      mainBackground: const Color(0xfff0f0f0),
      title: const Color(0xff1a1a1a),
      channelColorSwatches: ChannelColorSwatches.light,
      atMentionMarker: const HSLColor.fromAHSL(0.5, 0, 0, 0.2).toColor(),
      dmHeaderBg: const HSLColor.fromAHSL(1, 46, 0.35, 0.93).toColor(),
      errorBannerBackground: const HSLColor.fromAHSL(1, 4, 0.33, 0.90).toColor(),
      errorBannerBorder: const HSLColor.fromAHSL(0.4, 3, 0.57, 0.33).toColor(),
      errorBannerLabel: const HSLColor.fromAHSL(1, 4, 0.58, 0.33).toColor(),
      groupDmConversationIcon: Colors.black.withValues(alpha: 0.5),
      groupDmConversationIconBg: const Color(0x33808080),
      loginOrDivider: const Color(0xffdedede),
      loginOrDividerText: const Color(0xff575757),
      mutedUnreadBadge: const HSLColor.fromAHSL(0.5, 0, 0, 0.8).toColor(),
      sectionCollapseIcon: const Color(0x7f1e2e48),
      star: const HSLColor.fromAHSL(0.5, 47, 1, 0.41).toColor(),
      subscriptionListHeaderLine: const HSLColor.fromAHSL(0.2, 240, 0.1, 0.5).toColor(),
      subscriptionListHeaderText: const HSLColor.fromAHSL(1.0, 240, 0.1, 0.5).toColor(),
      unreadCountBadgeTextForChannel: Colors.black.withValues(alpha: 0.9),
    );

    DesignVariables.dark() :
    this._(
      background: const Color(0xff000000),  // Keeps deep black background for full dark contrast.
      bgCounterUnread: const Color(0xff333366).withValues(alpha: 0.37),  // Darkened for better contrast with lighter text.
      bgTopBar: const Color(0xff1a1a1a),  // Darkened for better distinction from the background.
      borderBar: Colors.black.withValues(alpha: 0.41),  // Lower contrast for subtle visibility.
      icon: const Color(0xff8080ff),  // Slightly lighter to pop more on the dark background.
      labelCounterUnread: const Color(0xffffffff).withValues(alpha: 0.7),  // High contrast to stand out.
      labelEdited: const HSLColor.fromAHSL(0.35, 0, 0, 1).toColor(),  // Higher visibility for edits.
      labelMenuButton: const Color(0xffffffff).withValues(alpha: 0.85),  // Clearer text for buttons.
      mainBackground: const Color(0xff151515),  // Slightly darker to create separation from the background components.
      title: const Color(0xffffffff),  // Pure white for sharp title contrast.
      channelColorSwatches: ChannelColorSwatches.dark,
      atMentionMarker: const HSLColor.fromAHSL(0.4, 0, 0, 1).toColor(),  // Kept unchanged for distinct mentions.
      dmHeaderBg: const HSLColor.fromAHSL(1, 46, 0.15, 0.2).toColor(),  // Slightly adjusted for better readability.
      errorBannerBackground: const HSLColor.fromAHSL(1, 0, 0.61, 0.25).toColor(),  // Darkened to make errors stand out without being harsh.
      errorBannerBorder: const HSLColor.fromAHSL(0.4, 3, 0.73, 0.74).toColor(),  // Higher contrast for error borders.
      errorBannerLabel: const HSLColor.fromAHSL(1, 2, 0.73, 0.85).toColor(),  // Brightened for better legibility.
      groupDmConversationIcon: Colors.white.withValues(alpha: 0.5),  // Moderate transparency for conversation icons.
      groupDmConversationIconBg: const Color(0x33aaaaaa),  // Darkened to reduce clash with dark background.
      loginOrDivider: const Color(0xff303030),  // Slightly lighter gray to create clear division.
      loginOrDividerText: const Color(0xffb0b0b0),  // Softer text to create good contrast against divider.
      mutedUnreadBadge: const HSLColor.fromAHSL(0.5, 0, 0, 0.65).toColor(),  // Increased opacity for muted badge.
      sectionCollapseIcon: const Color(0x7fa0d0f0),  // Adjusted to enhance contrast for visibility.
      star: const HSLColor.fromAHSL(0.5, 47, 1, 0.5).toColor(),  // Slightly lighter for emphasis on important items.
      subscriptionListHeaderLine: const HSLColor.fromAHSL(0.4, 240, 0.1, 0.8).toColor(),  // Enhanced to separate the sections.
      subscriptionListHeaderText: const HSLColor.fromAHSL(1.0, 240, 0.1, 0.85).toColor(),  // Darkened for better contrast.
      unreadCountBadgeTextForChannel: Colors.white.withValues(alpha: 0.9),  // High contrast for unread count visibility.
    );


  DesignVariables._({
    required this.background,
    required this.bgCounterUnread,
    required this.bgTopBar,
    required this.borderBar,
    required this.icon,
    required this.labelCounterUnread,
    required this.labelEdited,
    required this.labelMenuButton,
    required this.mainBackground,
    required this.title,
    required this.channelColorSwatches,
    required this.atMentionMarker,
    required this.dmHeaderBg,
    required this.errorBannerBackground,
    required this.errorBannerBorder,
    required this.errorBannerLabel,
    required this.groupDmConversationIcon,
    required this.groupDmConversationIconBg,
    required this.loginOrDivider,
    required this.loginOrDividerText,
    required this.mutedUnreadBadge,
    required this.sectionCollapseIcon,
    required this.star,
    required this.subscriptionListHeaderLine,
    required this.subscriptionListHeaderText,
    required this.unreadCountBadgeTextForChannel,
  });

  /// The [DesignVariables] from the context's active theme.
  ///
  /// The [ThemeData] must include [DesignVariables] in [ThemeData.extensions].
  static DesignVariables of(BuildContext context) {
    final theme = Theme.of(context);
    final extension = theme.extension<DesignVariables>();
    assert(extension != null);
    return extension!;
  }

  final Color background;
  final Color bgCounterUnread;
  final Color bgTopBar;
  final Color borderBar;
  final Color icon;
  final Color labelCounterUnread;
  final Color labelEdited;
  final Color labelMenuButton;
  final Color mainBackground;
  final Color title;

  // Not exactly from the Figma design, but from Vlad anyway.
  final ChannelColorSwatches channelColorSwatches;

  // Not named variables in Figma; taken from older Figma drafts, or elsewhere.
  final Color atMentionMarker;
  final Color dmHeaderBg;
  final Color errorBannerBackground;
  final Color errorBannerBorder;
  final Color errorBannerLabel;
  final Color groupDmConversationIcon;
  final Color groupDmConversationIconBg;
  final Color loginOrDivider; // TODO(design-dark) need proper dark-theme color (this is ad hoc)
  final Color loginOrDividerText; // TODO(design-dark) need proper dark-theme color (this is ad hoc)
  final Color mutedUnreadBadge;
  final Color sectionCollapseIcon;
  final Color star;
  final Color subscriptionListHeaderLine;
  final Color subscriptionListHeaderText;
  final Color unreadCountBadgeTextForChannel;

  @override
  DesignVariables copyWith({
    Color? background,
    Color? bgCounterUnread,
    Color? bgTopBar,
    Color? borderBar,
    Color? icon,
    Color? labelCounterUnread,
    Color? labelEdited,
    Color? labelMenuButton,
    Color? mainBackground,
    Color? title,
    ChannelColorSwatches? channelColorSwatches,
    Color? atMentionMarker,
    Color? dmHeaderBg,
    Color? errorBannerBackground,
    Color? errorBannerBorder,
    Color? errorBannerLabel,
    Color? groupDmConversationIcon,
    Color? groupDmConversationIconBg,
    Color? loginOrDivider,
    Color? loginOrDividerText,
    Color? mutedUnreadBadge,
    Color? sectionCollapseIcon,
    Color? star,
    Color? subscriptionListHeaderLine,
    Color? subscriptionListHeaderText,
    Color? unreadCountBadgeTextForChannel,
  }) {
    return DesignVariables._(
      background: background ?? this.background,
      bgCounterUnread: bgCounterUnread ?? this.bgCounterUnread,
      bgTopBar: bgTopBar ?? this.bgTopBar,
      borderBar: borderBar ?? this.borderBar,
      icon: icon ?? this.icon,
      labelCounterUnread: labelCounterUnread ?? this.labelCounterUnread,
      labelEdited: labelEdited ?? this.labelEdited,
      labelMenuButton: labelMenuButton ?? this.labelMenuButton,
      mainBackground: mainBackground ?? this.mainBackground,
      title: title ?? this.title,
      channelColorSwatches: channelColorSwatches ?? this.channelColorSwatches,
      atMentionMarker: atMentionMarker ?? this.atMentionMarker,
      dmHeaderBg: dmHeaderBg ?? this.dmHeaderBg,
      errorBannerBackground: errorBannerBackground ?? this.errorBannerBackground,
      errorBannerBorder: errorBannerBorder ?? this.errorBannerBorder,
      errorBannerLabel: errorBannerLabel ?? this.errorBannerLabel,
      groupDmConversationIcon: groupDmConversationIcon ?? this.groupDmConversationIcon,
      groupDmConversationIconBg: groupDmConversationIconBg ?? this.groupDmConversationIconBg,
      loginOrDivider: loginOrDivider ?? this.loginOrDivider,
      loginOrDividerText: loginOrDividerText ?? this.loginOrDividerText,
      mutedUnreadBadge: mutedUnreadBadge ?? this.mutedUnreadBadge,
      sectionCollapseIcon: sectionCollapseIcon ?? this.sectionCollapseIcon,
      star: star ?? this.star,
      subscriptionListHeaderLine: subscriptionListHeaderLine ?? this.subscriptionListHeaderLine,
      subscriptionListHeaderText: subscriptionListHeaderText ?? this.subscriptionListHeaderText,
      unreadCountBadgeTextForChannel: unreadCountBadgeTextForChannel ?? this.unreadCountBadgeTextForChannel,
    );
  }

  @override
  DesignVariables lerp(DesignVariables other, double t) {
    if (identical(this, other)) {
      return this;
    }
    return DesignVariables._(
      background: Color.lerp(background, other.background, t)!,
      bgCounterUnread: Color.lerp(bgCounterUnread, other.bgCounterUnread, t)!,
      bgTopBar: Color.lerp(bgTopBar, other.bgTopBar, t)!,
      borderBar: Color.lerp(borderBar, other.borderBar, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
      labelCounterUnread: Color.lerp(labelCounterUnread, other.labelCounterUnread, t)!,
      labelEdited: Color.lerp(labelEdited, other.labelEdited, t)!,
      labelMenuButton: Color.lerp(labelMenuButton, other.labelMenuButton, t)!,
      mainBackground: Color.lerp(mainBackground, other.mainBackground, t)!,
      title: Color.lerp(title, other.title, t)!,
      channelColorSwatches: ChannelColorSwatches.lerp(channelColorSwatches, other.channelColorSwatches, t),
      atMentionMarker: Color.lerp(atMentionMarker, other.atMentionMarker, t)!,
      dmHeaderBg: Color.lerp(dmHeaderBg, other.dmHeaderBg, t)!,
      errorBannerBackground: Color.lerp(errorBannerBackground, other.errorBannerBackground, t)!,
      errorBannerBorder: Color.lerp(errorBannerBorder, other.errorBannerBorder, t)!,
      errorBannerLabel: Color.lerp(errorBannerLabel, other.errorBannerLabel, t)!,
      groupDmConversationIcon: Color.lerp(groupDmConversationIcon, other.groupDmConversationIcon, t)!,
      groupDmConversationIconBg: Color.lerp(groupDmConversationIconBg, other.groupDmConversationIconBg, t)!,
      loginOrDivider: Color.lerp(loginOrDivider, other.loginOrDivider, t)!,
      loginOrDividerText: Color.lerp(loginOrDividerText, other.loginOrDividerText, t)!,
      mutedUnreadBadge: Color.lerp(mutedUnreadBadge, other.mutedUnreadBadge, t)!,
      sectionCollapseIcon: Color.lerp(sectionCollapseIcon, other.sectionCollapseIcon, t)!,
      star: Color.lerp(star, other.star, t)!,
      subscriptionListHeaderLine: Color.lerp(subscriptionListHeaderLine, other.subscriptionListHeaderLine, t)!,
      subscriptionListHeaderText: Color.lerp(subscriptionListHeaderText, other.subscriptionListHeaderText, t)!,
      unreadCountBadgeTextForChannel: Color.lerp(unreadCountBadgeTextForChannel, other.unreadCountBadgeTextForChannel, t)!,
    );
  }
}

/// The theme-appropriate [ChannelColorSwatch] based on [subscription.color].
///
/// For how this value is cached, see [ChannelColorSwatches.forBaseColor].
ChannelColorSwatch colorSwatchFor(BuildContext context, Subscription subscription) {
  return DesignVariables.of(context)
    .channelColorSwatches.forBaseColor(subscription.color);
}
