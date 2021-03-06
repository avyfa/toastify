﻿namespace Toastify.Common
{
    public class EnumComboBoxItem
    {
        #region Public Properties

        public object Value { get; set; }
        public string Description { get; set; }
        public string Tooltip { get; set; }

        #endregion

        public EnumComboBoxItem(object value, string description) : this(value, description, null)
        {
        }

        public EnumComboBoxItem(object value, string description, string tooltip)
        {
            this.Value = value;
            this.Description = string.IsNullOrWhiteSpace(description) ? value.ToString() : description;
            this.Tooltip = tooltip;
        }
    }
}