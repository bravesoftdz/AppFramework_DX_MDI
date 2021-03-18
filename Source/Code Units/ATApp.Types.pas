// ******************************************************************
//
// Program Name   : AppFwk
// Platform(s)    : Win32, Win64
// Framework      : VCL
//
// Filename       : ATApp.Types.pas
// Date Created   : 17-Mar-2021
// Author         : Matthew Vesperman
//
// Description:
//
// Declares various common types for the application.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2021 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   Declares various common types for the application.
/// </summary>
unit ATApp.Types;

interface

type
  /// <summary>
  ///   This enum is to specify the type of form for the
  ///   TATFormTypeAttribute type.
  /// </summary>
  TATFormTypeEnum = (
    /// <summary>
    ///   The form type is not specified.
    /// </summary>
    fteUnspecified,
    /// <summary>
    ///   The form is a MDI child form.
    /// </summary>
    fteChild,
    /// <summary>
    ///   The form is a MDI child form that can be closed during app
    ///   runtime.
    /// </summary>
    fteCloseableChild,
    /// <summary>
    ///   The form is a dialog box.
    /// </summary>
    fteDialog,
    /// <summary>
    ///   The form is the MDI frame window. (aka Main Form)
    /// </summary>
    fteMainForm,
    /// <summary>
    ///   <para>
    ///     The form is a MDI child form that cannot be closed
    ///     during app runtime.
    ///   </para>
    ///   <para>
    ///     ie. The window only closes when the app is closed.
    ///   </para>
    /// </summary>
    fteNonClosableChild);

implementation

end.
