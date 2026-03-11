from .models import RecentActivity

def log_activity(patient_user, activity_type, title, item_id=None):
    """
    Utility to record or update a recent activity.
    Moves the activity to the top if it already exists for that item_id.
    """
    # Use update_or_create to move to top (due to auto_now=True)
    # If item_id is None, we always create a new one (e.g. generalized activity)
    if item_id:
        RecentActivity.objects.update_or_create(
            patient=patient_user,
            activity_type=activity_type,
            item_id=str(item_id),
            defaults={'title': title}
        )
    else:
        RecentActivity.objects.create(
            patient=patient_user,
            activity_type=activity_type,
            title=title
        )
